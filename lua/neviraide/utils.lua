---@type NeviraideUtils
local M = {}

function M.formatexpr()
  -- if Util.has("conform.nvim") then
  --   return require("conform").formatexpr()
  -- end
  return vim.lsp.formatexpr({ timeout_ms = 3000 })
end

function M.foldtext()
  local ok = pcall(vim.treesitter.get_parser, vim.api.nvim_get_current_buf())
  local ret = ok and vim.treesitter.foldtext and vim.treesitter.foldtext()
  if not ret or type(ret) == 'string' then
    ret = {
      {
        vim.api.nvim_buf_get_lines(0, vim.v.lnum - 1, vim.v.lnum, false)[1],
        {},
      },
    }
  end
  table.insert(ret, { ' 󰇘' })

  if not vim.treesitter.foldtext then
    return table.concat(
      vim.tbl_map(function(line) return line[1] end, ret),
      ' '
    )
  end
  return ret
end

M.skip_foldexpr = {} ---@type table<number,boolean>
local skip_check = assert(vim.uv.new_check())

function M.foldexpr()
  local buf = vim.api.nvim_get_current_buf()

  -- still in the same tick and no parser
  if M.skip_foldexpr[buf] then return '0' end

  -- don't use treesitter folds for non-file buffers
  if vim.bo[buf].buftype ~= '' then return '0' end

  -- as long as we don't have a filetype, don't bother
  -- checking if treesitter is available (it won't)
  if vim.bo[buf].filetype == '' then return '0' end

  local ok = pcall(vim.treesitter.get_parser, buf)

  if ok then return vim.treesitter.foldexpr() end

  -- no parser available, so mark it as skip
  -- in the next tick, all skip marks will be reset
  M.skip_foldexpr[buf] = true
  skip_check:start(function()
    M.skip_foldexpr = {}
    skip_check:stop()
  end)
  return '0'
end

M.mason_path = function()
  local path_to_add = vim.fn.expand('~/.local/share/nvim/mason/bin')
  local current_path = vim.fn.getenv('PATH')
  if not string.find(current_path, tostring(path_to_add), 1, true) then
    vim.fn.setenv('PATH', current_path .. ':' .. path_to_add)
  end
end

local function if_require(module, block, errblock)
  local ok, mod = pcall(require, module)
  if ok then
    return block(mod)
  elseif errblock then
    return errblock(mod)
  else
    vim.api.nvim_err_writeln('Failed to load ' .. module .. ': ' .. mod)
    return nil
  end
end

---@param plugin string
function M.has(plugin)
  return require('lazy.core.config').spec.plugins[plugin] ~= nil
end

-- NOTE: make sure about 'clear' parameter
function M.autocmd(group, events, opts, clear)
  clear = (clear == nil) and true or clear
  group = vim.api.nvim_create_augroup(group, { clear = clear })
  opts.group = group
  vim.api.nvim_create_autocmd(events, opts)
end

function M.autocmd_multi(group, cmds, clear)
  clear = (clear == nil) and true or clear
  group = vim.api.nvim_create_augroup(group, { clear = clear })
  for _, c in ipairs(cmds) do
    local opts = c[2]
    opts.group = group
    vim.api.nvim_create_autocmd(c[1], opts)
  end
end

---@param fn fun()
function M.on_very_lazy(fn)
  vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    callback = function() fn() end,
  })
end

--- Set global highlight
--- @param name string highlight group
--- @param value table keys
function M.hi(name, value) vim.api.nvim_set_hl(0, name, value) end

-- function M.wk_reg(...)
--   local args = { ... }
--   if_require(
--     'which-key',
--     function(wk) return wk.register(unpack(args)) end,
--     function(_)
--       vim.api.nvim_err_writeln(
--         'WhichKeys not installed; cannot apply mappings!'
--       )
--     end
--   )
-- end

-- ---Wrapper for require('neviraide.mappings')
-- ---@param keys? string
-- ---@return function
-- function M.mappings(keys)
--   if keys then
--     return require('neviraide.mappings.' .. keys)
--   else
--     return require('neviraide.mappings')
--   end
-- end

---@param direction string
M.term_toggle = function(direction)
  local check =
    M.check_missing('nvterm.terminal', 'https://github.com/NvChad/nvterm')
  if check ~= nil then
    if check['toggle'] ~= nil then return check.toggle(direction) end
  end
end

---@param plugin string
---@param link? string
function M.check_missing(plugin, link)
  local ok, check = pcall(require, plugin)
  local message = {
    main = 'Plugin "' .. plugin .. '" NOT found!',
    separator = '\n   --------------------   ',
    helper = {
      main = '\nCheck:\n  1. Plugins configuration',
      link = '\n  2. ' .. link,
    },
  }
  if ok then
    return check
  else
    if link then
      return vim.notify(
        message.main
          .. message.separator
          .. message.helper.main
          .. message.helper.link,
        4
      )
    else
      return vim.notify(
        message.main .. message.separator .. message.helper.main,
        4
      )
    end
  end
end

---@return table
M.icons = function()
  if vim.g.nonicons then
    return {
      global = require('neviraide-ui.icons.nonicons'),
      lspkind = require('neviraide-ui.icons.nonicons.lspkind'),
    }
  end
  return {
    global = require('neviraide-ui.icons.devicons'),
    lspkind = require('neviraide-ui.icons.devicons.lspkind'),
  }
end

---Return plugins options
---@param plugin_name string
---@return function
M.con = function(plugin_name)
  return require('plugins.' .. plugin_name .. '.config')
end

---Return plugins options
---@param plugin_name string
---@return function
M.opt = function(plugin_name)
  return require('plugins.' .. plugin_name .. '.options')
end

return M

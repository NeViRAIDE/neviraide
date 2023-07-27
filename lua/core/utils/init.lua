-- TODO: util for icons
-- TODO: util for require function
local M = {}

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


-- FIX: to read from directory
function M.config_plugins(plugins)
  local conf = {}
  for category, plugins_in_category in pairs(plugins) do
    for _, el in pairs(plugins_in_category) do
      if category == 'other' then
        table.insert(conf, el)
      else
        table.insert(conf, require('plugins.config.' .. category .. '.' .. el))
      end
    end
  end
  return conf
end

---@param plugin string
function M.has(plugin)
  return require("lazy.core.config").spec.plugins[plugin] ~= nil
end

function M.load_mappings(...)
  local args = { ... }
  if_require(
    'which-key',
    function(wk) return wk.register(unpack(args)) end,
    function(_)
      vim.api.nvim_err_writeln(
        'WhichKeys not installed; cannot apply mappings!'
      )
    end
  )
end

--- Create autocommand
---@param group string
---@param events string | table
---@param opts table pattern, description and command/callback
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

function M.save_and_format()
  local file_name = vim.fn.expand('%:t')
  if vim.lsp.buf.server_ready() == true then
    vim.lsp.buf.format()
    vim.cmd('silent! wa')
    vim.notify(
      'File "' .. file_name .. '" was formated and saved',
      2,
      { title = 'Saved and formated', icon = '✓' }
    )
  else
    vim.cmd('silent! wa')
    vim.notify(
      'File "' .. file_name .. '" was saved',
      2,
      { title = 'Saved', icon = '✓' }
    )
  end
end

--Length of filepath.
------
--Possible parameters are:
--  - filename
--  - directory
--  - directory and filename
--  - full path
---@param length string
function M.filePath(length)
  if length == 'file' then
    return vim.api.nvim_exec('echo expand("%:t")', '')
  elseif length == 'dir_file' then
    return vim.api.nvim_exec('echo @%', '')
  elseif length == 'dir_only' then
    return vim.api.nvim_exec('echo expand("%:h")', '')
  elseif length == 'full' then
    return vim.api.nvim_exec('echo expand("%:p")', '')
  end
end

---@param fn fun()
function M.on_very_lazy(fn)
  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      fn()
    end,
  })
end

--- Set global highlight
--- @param name string highlight group
--- @param value table keys
function M.hi(name, value) vim.api.nvim_set_hl(0, name, value) end

return M

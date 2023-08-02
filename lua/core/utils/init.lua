local M = {}

---@return string
function M.nvim_version()
  local nvim_full_version_info = vim.fn.execute('version')
  if nvim_full_version_info:match('NVIM') then
    return nvim_full_version_info:match('NVIM [^\n]*')
  else
    return 'Check your alpha configuration file'
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

local count_bufs_by_type = function(loaded_only)
  loaded_only = (loaded_only == nil and true or loaded_only)
  local count = {
    normal = 0,
    acwrite = 0,
    help = 0,
    nofile = 0,
    nowrite = 0,
    quickfix = 0,
    terminal = 0,
    prompt = 0,
    term = 0,
  }
  local buftypes = vim.api.nvim_list_bufs()
  for _, bufname in pairs(buftypes) do
    if not loaded_only or vim.api.nvim_buf_is_loaded(bufname) then
      local buftype = vim.api.nvim_buf_get_option(bufname, 'buftype')
      buftype = buftype ~= '' and buftype or 'normal'
      count[buftype] = count[buftype] + 1
    end
  end
  return count
end

function M.close_buffer()
  local bufTable = count_bufs_by_type()
  if bufTable.normal <= 1 then
    if vim.bo.buftype == 'terminal' then
      vim.api.nvim_exec([[:bd!]], true)
    else
      vim.api.nvim_exec(':bd', true)
      vim.api.nvim_exec(':Alpha', true)
      vim.api.nvim_exec(':bd#', true)
    end
  else
    vim.api.nvim_exec(':bd', true)
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
  vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    callback = function() fn() end,
  })
end

--- Set global highlight
--- @param name string highlight group
--- @param value table keys
function M.hi(name, value) vim.api.nvim_set_hl(0, name, value) end

function M.wk_reg(...)
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

---Wrapper for require('core.mappings')
---@param keys? string
---@return function
function M.mappings(keys)
  if keys then
    return require('core.mappings.' .. keys)
  else
    return require('core.mappings')
  end
end

function M.replace_word(old, new)
  local neviraide_conf = vim.fn.stdpath('config') .. '/lua/' .. 'NEVIRAIDE.lua'
  local file = io.open(neviraide_conf, 'r')
  local added_pattern = string.gsub(old, '-', '%%-') -- add % before - if exists
  local new_content = file:read('*all'):gsub(added_pattern, new)

  file = io.open(neviraide_conf, 'w')
  file:write(new_content)
  file:close()
end


return M

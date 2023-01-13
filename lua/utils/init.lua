function _G.opt(o, v, scopes)
  scopes = scopes or { vim.o }
  for _, s in ipairs(scopes) do
    s[o] = v
  end
end

--- Create autocommand
---@param group string
---@param events string | table
---@param opts table pattern, description and command/callback
function _G.autocmd(group, events, opts, clear)
  clear = (clear == nil) and true or clear
  group = vim.api.nvim_create_augroup(group, { clear = clear })
  opts.group = group
  vim.api.nvim_create_autocmd(events, opts)
end

--- Set global highlight
--- @param name string highlight group
--- @param value table keys
function _G.hi(name, value) vim.api.nvim_set_hl(0, name, value) end

--- Multi autocommands in one group
---@param group string
---@param cmds table command with event, pattern, description and command/callback
function _G.autocmd_multi(group, cmds, clear)
  clear = (clear == nil) and true or clear
  group = vim.api.nvim_create_augroup(group, { clear = clear })
  for _, c in ipairs(cmds) do
    local opts = c[2]
    opts.group = group
    vim.api.nvim_create_autocmd(c[1], opts)
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

function _G.close_buffer()
  local bufTable = count_bufs_by_type()
  if bufTable.normal <= 1 then
    if vim.bo.buftype == 'terminal' then
      vim.api.nvim_exec([[:bd!]], true)
    else
      vim.api.nvim_exec([[:bd]], true)
      vim.api.nvim_exec([[:Alpha]], true)
    end
  else
    vim.api.nvim_exec([[:bd]], true)
  end
end

function _G.save_and_format()
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

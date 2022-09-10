--- Add icon from nvim-nonicons
---@param icon_name string
---@return string
function _G.icon(icon_name)
  local icons = require('nvim-nonicons')
  local icon = icons.get(icon_name)
  return icon .. ' '
end

function _G.opt(o, v, scopes)
  scopes = scopes or { vim.o }
  for _, s in ipairs(scopes) do
    s[o] = v
  end
end

--- Create autocommand
---@param group string
---@param events string | table
---@param opts table
function _G.autocmd(group, events, opts, clear)
  clear = (clear == nil) and true or clear
  group = vim.api.nvim_create_augroup(group, { clear = clear })
  opts.group = group
  vim.api.nvim_create_autocmd(events, opts)
end

function _G.autocmd_multi(group, cmds, clear)
  clear = (clear == nil) and true or clear
  group = vim.api.nvim_create_augroup(group, { clear = clear })
  for _, c in ipairs(cmds) do
    local opts = c[2]
    opts.group = group
    vim.api.nvim_create_autocmd(c[1], opts)
  end
end

local function buffer_not_empty() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end

--- Hide if window width more than 90
---@return boolean
local function hide_in_width() return vim.fn.winwidth(0) > 90 end

return {
  buffer_not_empty = buffer_not_empty,
  hide_in_width = hide_in_width,
}

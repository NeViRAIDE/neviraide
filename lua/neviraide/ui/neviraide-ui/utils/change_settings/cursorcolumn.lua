local M = {}

local write = require('neviraide.ui.neviraide-ui.utils').replace_word

function M.toggle()
  vim.o.cursorcolumn = not vim.o.cursorcolumn
  local old = 'cursor_column = ' .. tostring(NEVIRAIDE().cursor_column)
  local new = 'cursor_column = ' .. tostring(vim.o.cursorcolumn)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.enable()
  vim.o.cursorcolumn = true
  local old = 'cursor_column = ' .. tostring(NEVIRAIDE().cursor_column)
  local new = 'cursor_column = ' .. tostring(vim.o.cursorcolumn)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.toggle_cursor_column()
  vim.o.cursorcolumn = false
  local old = 'cursor_column = ' .. tostring(NEVIRAIDE().cursor_column)
  local new = 'cursor_column = ' .. tostring(vim.o.cursorcolumn)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

return M

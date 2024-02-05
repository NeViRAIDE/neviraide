local M = {}

local write = require('neviraide.ui.neviraide-ui.utils').replace_word

function M.toggle()
  vim.o.cursorline = not vim.o.cursorline
  local old = 'cursor_line = ' .. tostring(NEVIRAIDE().cursor_line)
  local new = 'cursor_line = ' .. tostring(vim.o.cursorline)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.enable()
  vim.o.cursorline = true
  local old = 'cursor_line = ' .. tostring(NEVIRAIDE().cursor_line)
  local new = 'cursor_line = ' .. tostring(vim.o.cursorline)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.disable()
  vim.o.cursorline = false
  local old = 'cursor_line = ' .. tostring(NEVIRAIDE().cursor_line)
  local new = 'cursor_line = ' .. tostring(vim.o.cursorline)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

return M

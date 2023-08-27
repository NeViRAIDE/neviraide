local M = {}

local write = require('neviraide.utils').replace_word
local o = vim.opt

function M.toggle_relative_numbers()
  local relative = NEVIRAIDE().relative_numbers
  write(
    'relative_numbers = ' .. tostring(relative),
    'relative_numbers = ' .. tostring(not relative)
  )
  require('plenary.reload').reload_module('NEVIRAIDE')
  o.relativenumber = not relative
end

function M.toggle_numbers()
  local numbers = NEVIRAIDE().numbers
  write(
    'numbers = ' .. tostring(numbers),
    'numbers = ' .. tostring(not numbers)
  )
  require('plenary.reload').reload_module('NEVIRAIDE')
  o.number = not numbers
end

function M.toggle_cursor_line()
  local line = NEVIRAIDE().cursor_line
  write(
    'cursor_line = ' .. tostring(line),
    'cursor_line = ' .. tostring(not line)
  )
  require('plenary.reload').reload_module('NEVIRAIDE')
  o.cursorline = not line
end

function M.toggle_cursor_column()
  local column = NEVIRAIDE().cursor_column
  write(
    'cursor_column = ' .. tostring(column),
    'cursor_column = ' .. tostring(not column)
  )
  require('plenary.reload').reload_module('NEVIRAIDE')
  o.cursorcolumn = not column
end

return M

local M = {}

local write = require('core.utils').replace_word
local o = vim.opt

function M.toggle_relative_numbers()
  if require('NEVIRAIDE').ui.number.relative == false then
    o.relativenumber = true
    write('relative = false', 'relative = true')
  else
    o.relativenumber = false
    write('relative = true', 'relative = false')
  end
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.toggle_numbers()
  if require('NEVIRAIDE').ui.number.enabled == false then
    o.number = true
    write('enabled = false', 'enabled = true')
  else
    o.number = false
    write('enabled = true', 'enabled = false')
  end
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.toggle_transparency()
  if require('NEVIRAIDE').ui.transparency == false then
    write('transparency = false', 'transparency = true')
  else
    write('transparency = true', 'transparency = false')
  end
  require('plenary.reload').reload_module('NEVIRAIDE')
  vim.fn.execute('TransparentToggle')
end

function M.toggle_cursor_line()
  if require('NEVIRAIDE').ui.cursor.line == false then
    o.cursorline = true
    write('line = false', 'line = true')
  else
    o.cursorline = false
    write('line = true', 'line = false')
  end
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.toggle_cursor_column()
  if require('NEVIRAIDE').ui.cursor.column == false then
    o.cursorcolumn = true
    write('column = false', 'column = true')
  else
    o.cursorcolumn = false
    write('column = true', 'column = false')
  end
  require('plenary.reload').reload_module('NEVIRAIDE')
end
return M

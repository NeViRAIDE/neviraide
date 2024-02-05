local M = {}

local write = require('neviraide.ui.neviraide-ui.utils').replace_word

function M.toggle()
  vim.o.relativenumber = not vim.o.relativenumber
  local old = 'relative_numbers = ' .. tostring(NEVIRAIDE().relative_numbers)
  local new = 'relative_numbers = ' .. tostring(vim.o.relativenumber)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.enable()
  vim.o.relativenumber = true
  local old = 'relative_numbers = ' .. tostring(NEVIRAIDE().relative_numbers)
  local new = 'relative_numbers = ' .. tostring(vim.o.relativenumber)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.disable()
  vim.o.relativenumber = false
  local old = 'relative_numbers = ' .. tostring(NEVIRAIDE().relative_numbers)
  local new = 'relative_numbers = ' .. tostring(vim.o.relativenumber)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

return M

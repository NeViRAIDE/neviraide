local M = {}
local write = require('neviraide.ui.neviraide-ui.utils').replace_word

function M.toggle()
  vim.o.number = not vim.o.number
  local old = 'numbers_enabled = ' .. tostring(NEVIRAIDE().numbers_enabled)
  local new = 'numbers_enabled = ' .. tostring(vim.o.number)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.enable()
  vim.o.number = true
  local old = 'numbers_enabled = ' .. tostring(NEVIRAIDE().numbers_enabled)
  local new = 'numbers_enabled = ' .. tostring(vim.o.number)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.disable()
  vim.o.number = false
  local old = 'numbers_enabled = ' .. tostring(NEVIRAIDE().numbers_enabled)
  local new = 'numbers_enabled = ' .. tostring(vim.o.number)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

return M

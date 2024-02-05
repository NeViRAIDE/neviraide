local M = {}
local g = vim.g

local write = require('neviraide.ui.neviraide-ui.utils').replace_word

M.toggle = function()
  g.transparency = not g.transparency

  local old_data = 'transparency = ' .. tostring(NEVIRAIDE().transparency)
  local new_data = 'transparency = ' .. tostring(g.transparency)
  write(old_data, new_data)
  require('plenary.reload').reload_module('NEVIRAIDE')

  require('neviraide.ui.neviraide-ui.themes').load_all_highlights()
end

M.enable = function()
  g.transparency = true

  local old_data = 'transparency = ' .. tostring(NEVIRAIDE().transparency)
  local new_data = 'transparency = ' .. tostring(g.transparency)
  write(old_data, new_data)
  require('plenary.reload').reload_module('NEVIRAIDE')

  require('neviraide.ui.neviraide-ui.themes').load_all_highlights()
end

M.disable = function()
  g.transparency = false

  local old_data = 'transparency = ' .. tostring(NEVIRAIDE().transparency)
  local new_data = 'transparency = ' .. tostring(g.transparency)
  write(old_data, new_data)
  require('plenary.reload').reload_module('NEVIRAIDE')

  require('neviraide.ui.neviraide-ui.themes').load_all_highlights()
end

return M

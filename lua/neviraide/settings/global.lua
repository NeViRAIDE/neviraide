local g = vim.g
local N = NEVIRAIDE()

g.neviraide_themes_cache = vim.fn.stdpath('data') .. '/neviraide_ui/'
g.neviraide_theme = N.theme
g.transparency = N.transparency
g.borders = N.border
g.nonicons = N.nonicons
g.latest_plugins = N.latest

for _, provider in ipairs({ 'node', 'perl', 'python3', 'ruby' }) do
  g['loaded_' .. provider .. '_provider'] = 0
end

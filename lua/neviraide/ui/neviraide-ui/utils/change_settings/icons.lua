local M = {}

---@param icons string
M.set_icons = function(icons)
  if icons == 'nonicons' then
    vim.g.nonicons = true
  else
    vim.g.nonicons = false
  end

  local old = 'nonicons = ' .. tostring(NEVIRAIDE().nonicons)
  local new = 'nonicons = ' .. tostring(vim.g.nonicons)
  require('neviraide.ui.neviraide-ui.utils').replace_word(old, new)

  require('plenary.reload').reload_module('NEVIRAIDE')
end

return M

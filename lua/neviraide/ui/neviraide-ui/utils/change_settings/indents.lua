local M = {}

---@param size integer
function M.set_indents(size)
  vim.o.shiftwidth = size
  vim.o.tabstop = size
  vim.o.softtabstop = size

  local old = 'indents = ' .. NEVIRAIDE().indents
  local new = 'indents = ' .. size

  require('neviraide.ui.neviraide-ui.utils').replace_word(old, new)

  require('plenary.reload').reload_module('NEVIRAIDE')
end

return M

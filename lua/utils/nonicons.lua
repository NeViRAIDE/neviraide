--- Nonicons
---@param icon_name string
function _G.icon(icon_name)
  return require('nvim-nonicons').get(icon_name) .. ' '
end

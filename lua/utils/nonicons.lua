--- Nonicons
---@param icon_name string
function _G.icon(icon_name)
  -- if has('gui_running') then
  return require('nvim-nonicons').get(icon_name) .. ' '
  -- else
  --   return ''
  -- end
end

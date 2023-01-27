--- Nonicons
---@param icon_name string
-- TODO: disable icons if not nonicons or gui
function _G.icon(icon_name)
  -- if has('gui_running') then
  return require('nvim-nonicons').get(icon_name) .. ' '
  -- else
  --   return ''
  -- end
end

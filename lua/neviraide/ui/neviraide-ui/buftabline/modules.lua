local component =
  require('neviraide.ui.neviraide-ui.buftabline.modules.components')

require('neviraide.ui.neviraide-ui.buftabline.modules.onclick')

---@return string
return function()
  local modules = {
    component.NeoTreeOverlay(),
    component.bufferlist(),
    component.datetime(),
    component.tablist(),
    component.buttons(),
  }
  return table.concat(modules)
end

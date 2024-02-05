local Layout = require('nui.layout')
local popups = require('neviraide.ui.neviraide-ui.settings_nui.popups')

return Layout(
  popups.main,
  Layout.Box({
    Layout.Box(popups.tree, { size = '50%' }),
    Layout.Box(popups.desc, { size = '50%' }),
  }, { dir = 'row' })
)

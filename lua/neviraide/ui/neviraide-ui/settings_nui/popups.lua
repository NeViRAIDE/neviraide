local Popup = require('nui.popup')
local utils = require('neviraide.ui.neviraide-ui.override_vim_ui.utils')

return {
  main = Popup({
    border = utils.nui_border({
      top = ' Settings ',
    }),
    position = '50%',
    size = '50%',
    relative = 'editor',
  }),
  tree = Popup({
    enter = true,
    border = 'rounded',
  }),
  desc = Popup({
    border = 'rounded',
  }),
}

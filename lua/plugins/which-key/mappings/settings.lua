local icon = require('neviraide.ui.neviraide-ui.icons.utils').icon

return {
  name = 'Settings' .. icon('', 'gear', 1),
  d = {
    function()
      require('neviraide-ui.buftabline.modules.components').toggle_datetime()
    end,
    'Date/time style',
  },
}

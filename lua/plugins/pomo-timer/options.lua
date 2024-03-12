local icon = require('neviraide-ui.icons.utils').icon

return {
  update_interval = 1000,
  notifiers = {
    {
      name = 'Default',
      opts = {
        sticky = false,
        title_icon = icon('󱎫', 'stopwatch', 0, 1),
        text_icon = '',
      },
    },
  },
}

local ui = require('NEVIRAIDE')

return {
  name = 'Nordic',
  colors = {
    { bg = 'dark', name = 'Nordic', cmd = 'nordic' },
  },
  plugin = {
    'AlexvZyl/nordic.nvim',
    version = '*',
    opts = {
      transparent_bg = ui.transparency,
      noice = { style = 'classic' },
    },
  },
}

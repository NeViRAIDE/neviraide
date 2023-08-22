local ui = require('NEVIRAIDE')

return {
  name = 'GruvBox',
  colors = {
    { bg = 'dark', name = 'Dark', cmd = 'gruvbox', pallete = 'dark' },
    { bg = 'light', name = 'Light', cmd = 'gruvbox', pallete = 'light' },
  },
  plugin = {
    'ellisonleao/gruvbox.nvim',
    version = '*',
    opts = {
      transparent_mode = ui.transparency,
      contrast = ui.pallete,
    },
  },
}

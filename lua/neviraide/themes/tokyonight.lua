local ui = require('NEVIRAIDE')

return {
  name = 'TokyoNight',
  colors = {
    { bg = 'dark', name = 'Moon', cmd = 'tokyonight-moon' },
    { bg = 'dark', name = 'Night', cmd = 'tokyonight-night' },
    { bg = 'dark', name = 'Storm', cmd = 'tokyonight-storm' },
    { bg = 'light', name = 'Day', cmd = 'tokyonight-day' },
  },
  plugin = {
    'folke/tokyonight.nvim',
    version = '*',
    opts = {
      transparent = ui.transparency,
      day_brightness = 0.1,
    },
  },
}

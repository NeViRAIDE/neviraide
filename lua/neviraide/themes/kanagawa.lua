local ui = require('NEVIRAIDE')

return {
  name = 'Kanagawa',
  colors = {

    { bg = 'dark', name = 'Wave', cmd = 'kanagawa-wave' },
    { bg = 'dark', name = 'Dragon', cmd = 'kanagawa-dragon' },
    { bg = 'light', name = 'Lotus', cmd = 'kanagawa-lotus' },
  },
  plugin = {
    'rebelot/kanagawa.nvim',
    version = '*',
    opts = {
      compile = true,
      transparent = ui.transparency,
    },
  },
}

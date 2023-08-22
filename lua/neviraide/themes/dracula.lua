local ui = require('NEVIRAIDE')

return {
  name = 'Dracula',
  colors = {
    { bg = 'dark', name = 'Classic', cmd = 'dracula' },
    { bg = 'dark', name = 'Soft', cmd = 'dracula-soft' },
  },
  plugin = {
    'Mofiqul/dracula.nvim',
    version = '*',
    opts = {
      italic_comment = true,
      transparent_bg = ui.transparency,
    },
  },
}

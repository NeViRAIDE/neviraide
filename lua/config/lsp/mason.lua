local icon = require('neviraide-ui.icons.utils').icon

dofile(vim.g.neviraide_themes_cache .. 'mason')

require('mason').setup({
  ui = {
    border = NEVIRAIDE().border,
    width = 0.6,
    height = 0.8,
    icons = {
      package_installed = icon('check') .. ' ',
      package_pending = icon('sync') .. ' ',
      package_uninstalled = icon('x') .. ' ',
    },
  },
})

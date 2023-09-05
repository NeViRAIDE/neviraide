local icon = require('neviraide-ui.icons.utils').icon

dofile(vim.g.neviraide_themes_cache .. 'mason')

require('mason').setup({
  ui = {
    border = vim.g.borders,
    width = 0.6,
    height = 0.8,
    icons = {
      package_installed = icon('', 'check', 0, 1),
      package_pending = icon('', 'sync', 0, 1),
      package_uninstalled = icon('', 'x', 0, 1),
    },
  },
})

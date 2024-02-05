return function()
  local icon = require('neviraide.ui.neviraide-ui.icons.utils').icon

  dofile(vim.g.ntc .. 'mason')

  require('mason').setup({
    ui = {
      border = vim.g.b,
      width = 0.6,
      height = 0.8,
      icons = {
        package_installed = icon('', 'check', 0, 1),
        package_pending = icon('', 'sync', 0, 1),
        package_uninstalled = icon('', 'x', 0, 1),
      },
    },
  })
end

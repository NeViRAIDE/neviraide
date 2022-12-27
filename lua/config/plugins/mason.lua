local M = {
  'williamboman/mason.nvim',
  dependencies = { 'williamboman/mason-lspconfig.nvim' },
}

function M.config()
  require('mason').setup({
    ui = {
      border = 'rounded',
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
    },
  })
end

return M

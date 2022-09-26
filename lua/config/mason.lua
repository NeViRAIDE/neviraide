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

require('mason-tool-installer').setup({
  ensure_installed = {
    'lua-language-server',
    'pyright',
    'html-lsp',
    'css-lsp',
    'debugpy',
    'black',
    'djlint',
    'isort',
    'prettier',
    'stylua',
  },
  auto_update = true,
  run_on_start = true,
})


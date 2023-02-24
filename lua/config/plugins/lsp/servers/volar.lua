-- FIX: not working hover and another on attaches
require('lspconfig').volar.setup({
  on_attach = require('config.plugins.lsp.on_attach').build(),
  capabilities = require('config.plugins.lsp.capabilities').build(),
  flags = { debounce_text_changes = 150 },
  filetypes = {
    'typescript',
    'javascript',
    'javascriptreact',
    'typescriptreact',
    'vue',
    'json',
  },
})

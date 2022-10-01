require('lspconfig').jsonls.setup({
  on_attach = require('lsp.on_attach').build(),
  capabilities = require('lsp.capabilities').build(),
})

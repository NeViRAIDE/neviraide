require('lspconfig').cssls.setup({
  on_attach = require('config.plugins.lsp.on_attach').build(),
  capabilities = require('config.plugins.lsp.capabilities').build(),
  single_file_support = true,
})

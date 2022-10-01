vim.lsp.handlers['textDocument/publishDiagnostics'] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = false,
    update_in_insert = false,
  })

require('mason-lspconfig').setup({
  automatic_installation = true,
})

require('lsp.servers.lua')
require('lsp.servers.pyright')
require('lsp.servers.html')
require('lsp.servers.css')
require('lsp.servers.json')

require('lsp.null-ls')

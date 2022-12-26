local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.gopls.setup {
  on_attach = require('config.plugins.lsp.on_attach').build(),
  capabilities = capabilities,
  flags = { debounce_text_changes = 150 },
  single_file_support = true,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true,
  }
}

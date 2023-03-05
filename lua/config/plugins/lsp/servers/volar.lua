-- FIX: not working
require('lspconfig').volar.setup({
  on_attach = require('config.plugins.lsp.on_attach').build(),
  capabilities = require('config.plugins.lsp.capabilities').build(),
  single_file_support = true,
  filetypes = {
    'typescript',
    'javascript',
    'javascriptreact',
    'typescriptreact',
    'vue',
    'json',
  },
  -- settings = {
  --   volar = {
  --     codeLens = {
  --       references = true,
  --       pugTools = true,
  --       scriptSetupTools = true,
  --     },
  --   },
  -- },
})

-- FIX: not working hover and another on attaches
require('lspconfig').volar.setup({
  on_attach = require('config.plugins.lsp.on_attach').build(),
  capabilities = require('config.plugins.lsp.capabilities').build(),
  flags = { debounce_text_changes = 150 },
  init_options = {
    typescript = {
      tsdk = '',
    },
    languageFeatures = {
      implementation = true, -- new in @volar/vue-language-server v0.33
      references = true,
      definition = true,
      typeDefinition = true,
      callHierarchy = true,
      hover = true,
      rename = true,
      renameFileRefactoring = true,
      signatureHelp = true,
      codeAction = true,
      workspaceSymbol = true,
      completion = {
        defaultTagNameCase = 'both',
        defaultAttrNameCase = 'kebabCase',
        getDocumentNameCasesRequest = false,
        getDocumentSelectionRequest = false,
      },
    },
  },
})

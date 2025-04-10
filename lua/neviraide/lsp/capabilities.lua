-- Using Neovim's native LSP capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Enable advanced completion capabilities natively
capabilities.textDocument.completion = {
  dynamicRegistration = true,
  completionItem = {
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    documentationFormat = { 'markdown', 'plaintext' },
    resolveSupport = {
      properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
      },
    },
  },
  contextSupport = true,
}

return capabilities

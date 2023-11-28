local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local capabilities = vim.tbl_deep_extend(
--   'force',
--   vim.lsp.protocol.make_client_capabilities(),
--   require('cmp_nvim_lsp').default_capabilities()
-- )

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { 'markdown', 'plaintext' },
  -- snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  -- deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  },
}

return capabilities

local autocmd_multi = require("core.utils").autocmd_multi

local signature_config = {
  bind = false,
  floating_window = false,
  hint_enable = true,
  use_lspsaga = false,
  hint_prefix = '  ',
  hint_scheme = 'Comment',
  hi_parameter = 'LspSignatureActiveParameter',
  max_height = 1,
}

return function(client, bufnr)
  require('lsp_signature').on_attach(signature_config, bufnr)

  require('mappings.lsp').attach_lsp(bufnr)
  require('mappings.diagnostic').attach_diagnostic(bufnr)
  -- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
  if client.server_capabilities.documentSymbolProvider then
    require('nvim-navic').attach(client, bufnr)
  end
  if client.server_capabilities.documentHighlightProvider then
    autocmd_multi('lsp_document_highlight', {
      {
        'CursorHold',
        {
          pattern = '*',
          desc = "Visual highlighting sybmol's references in document when cursor hold on it",
          command = 'lua vim.lsp.buf.document_highlight()',
        },
      },
      {
        'CursorMoved',
        {
          pattern = '*',
          desc = "Reset visual highlighting sybmol's references in document when cursor moved",
          command = 'lua vim.lsp.buf.clear_references()',
        },
      },
    })
  end
end

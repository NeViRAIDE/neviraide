local utils = require('core.utils')
local opts = require('core.lsp.options')

return function(client, bufnr)
  require('lsp_signature').on_attach(opts.signature, bufnr)
  -- require "inlay-hints".on_attach(client, bufnr)
  require('lsp-inlayhints').on_attach(client, bufnr)

  utils.mappings('lsp')(bufnr)
  utils.mappings('diagnostic')(bufnr)

  if client.server_capabilities.documentSymbolProvider then
    require('nvim-navic').attach(client, bufnr)
  end

  local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
  if opts.inlay_hints.enabled and inlay_hint then
    if client.server_capabilities.inlayHintProvider then
      inlay_hint(bufnr, true)
    end
  end

  if client.server_capabilities.documentHighlightProvider then
    utils.autocmd_multi('lsp_document_highlight', {
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

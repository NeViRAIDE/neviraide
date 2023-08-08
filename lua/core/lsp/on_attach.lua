return function(client, bufnr)
  local utils = require('core.utils')
  local opts = require('core.lsp.options')

  require('lsp_signature').on_attach(opts.signature, bufnr)
  require('lsp-inlayhints').on_attach(client, bufnr)

  local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
  local caps = client.server_capabilities

  utils.mappings('lsp')(bufnr)
  utils.mappings('diagnostic')(bufnr)

  if caps.documentSymbolProvider then
    require('nvim-navic').attach(client, bufnr)
  end

  if opts.inlay_hints.enabled and inlay_hint then
    if caps.inlayHintProvider then inlay_hint(bufnr, true) end
  end
end

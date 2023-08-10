return function(client, bufnr)
  local utils = require('core.utils')
  local opts = require('core.lsp.options')

  require('lsp_signature').on_attach(opts.signature, bufnr)

  utils.mappings('lsp')(bufnr)
  utils.mappings('diagnostic')(bufnr)

  if client.server_capabilities.documentSymbolProvider then
    require('nvim-navic').attach(client, bufnr)
  end
end

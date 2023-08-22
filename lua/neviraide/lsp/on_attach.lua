local border = require('neviraide.utils').border

return function(client, bufnr)
  local utils = require('neviraide.utils')
  local opts = require('neviraide.lsp.options')

  -- TODO: show scrollbar for hover and make keymaps

  vim.lsp.handlers['textDocument/hover'] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = border(),
    })

  vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = border(),
    })

  require('lsp_signature').on_attach(opts.signature, bufnr)

  utils.mappings('lsp')(bufnr)
  utils.mappings('diagnostic')(bufnr)

  if client.server_capabilities.documentSymbolProvider then
    require('nvim-navic').attach(client, bufnr)
  end
end

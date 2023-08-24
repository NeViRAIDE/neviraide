return function(_, bufnr)
  local border = require('neviraide.utils').border
  local utils = require('neviraide.utils')
  local opts = require('neviraide.lsp.options')

  vim.lsp.handlers['textDocument/hover'] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = border(),
    })

  vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = border(),
      focusable = false,
      relative = 'cursor',
    })

  require('lsp_signature').on_attach(opts.signature, bufnr)

  utils.mappings('lsp')(bufnr)
  utils.mappings('diagnostic')(bufnr)
end

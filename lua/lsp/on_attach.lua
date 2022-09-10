local M = {}

local signature_config = {
  bind = false,
  floating_window = false,
  hint_enable = true,
  use_lspsaga = true,
  hint_prefix = icon('eye') .. ' ',
  hint_scheme = 'LspSignatureActiveParameter',
  hi_parameter = 'LspSignatureActiveParameter',
  max_height = 1,
}

M.build = function()
  return function(client, bufnr)
    require('lsp_signature').on_attach(signature_config, bufnr)
    if client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_exec(
        [[
            hi LspReferenceRead  gui=bold
            hi LspReferenceText  gui=bold
            hi LspReferenceWrite gui=bold
            augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]],
        false
      )
    end
  end
end

return M

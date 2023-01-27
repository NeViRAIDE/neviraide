local M = {}

local signature_config = {
  bind = false,
  floating_window = false,
  hint_enable = true,
  use_lspsaga = false,
  hint_prefix = icon('eye'),
  hint_scheme = 'LspSignatureActiveParameterHint',
  hi_parameter = 'LspSignatureActiveParameter',
  max_height = 1,
}

M.build = function()
  return function(client, bufnr)
    if client.name == 'sqls' then
      require('sqls').on_attach(client, bufnr)
      require('config.plugins.which-key.keybindings.sql_keys').attach_sql(bufnr)
    end
    if client.server_capabilities.documentSymbolProvider then
      require('nvim-navic').attach(client, bufnr)
    end
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

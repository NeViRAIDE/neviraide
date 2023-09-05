local icon = require('neviraide-ui.icons.utils').icon

return function(client, bufnr)
  require('neviraide.utils').wk_reg({
    ['<leader>'] = {
      l = {
        name = 'LSP'..  icon('','server',1),
        a = { ':lua vim.lsp.buf.code_action()<cr>', 'Code action' },
        c = { ':lua vim.lsp.codelens.run()<cr>', 'Codelens action' },
        d = { ':Telescope lsp_definitions<cr>', 'Definition' },
        D = { ':lua vim.lsp.buf.declaration()<cr>', 'Declaration' },
        f = { ':lua vim.lsp.buf.format()<cr>', 'Format file' },
        h = { ':lua vim.lsp.buf.hover()<cr>', 'Hover' },
        r = { ':Telescope lsp_references<cr>', 'References' },
        R = { ':lua vim.lsp.buf.rename()<cr>', 'Rename' },
        s = { ':lua vim.lsp.buf.signature_help()<cr>', 'Signature help' },
        t = { ':Telescope lsp_type_definitions<cr>', 'Type definition' },
      },
    },
  }, { buffer = bufnr, mode = 'n' })
end

local mappings =
    require('utils').load_mappings

local M = {}

M.attach_lsp = function(bufnr)
  mappings({
    ['<leader>'] = {
      l = {
        name = 'LSP ' .. '',
        h = { ':lua vim.lsp.buf.hover()<cr>', 'Hover' },
        s = { ':lua vim.lsp.buf.signature_help()<cr>', 'Signature help' },
        r = { ':Telescope lsp_references<cr>', 'References' },
        a = { ':lua vim.lsp.buf.code_action()<cr>', 'Code action' },
        R = { ':lua vim.lsp.buf.rename()<cr>', 'Rename' },
        D = { ':lua vim.lsp.buf.declaration()<cr>', 'Declaration' },
        d = { ':Telescope lsp_definitions<cr>', 'Definition' },
        t = { ':Telescope lsp_type_definitions<cr>', 'Type definition' },
        c = { ':lua vim.lsp.codelens.run()<cr>', 'Codelens action' },
      }
    },
  }, { buffer = bufnr, mode = 'n' })
end

return M

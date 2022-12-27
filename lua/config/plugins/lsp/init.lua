local M = {
  'neovim/nvim-lspconfig',
  name = 'lsp',
  event = 'BufReadPre',
  dependencies = { 'hrsh7th/cmp-nvim-lsp' },
}

function M.config()
  require('config.plugins.lsp.diagnostics').setup()
  require('mason-lspconfig').setup({
    automatic_installation = true,
  })

  require('config.plugins.lsp.servers.gopls')
  require('config.plugins.lsp.servers.sumneko_lua')
end

return M

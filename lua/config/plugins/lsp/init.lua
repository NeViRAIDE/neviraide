local M = {
  'neovim/nvim-lspconfig',
  name = 'lsp',
  event = 'BufReadPre',
  dependencies = { 'hrsh7th/cmp-nvim-lsp' },
}

function M.config()
  require('config.plugins.lsp.diagnostics').setup()

  require('config.plugins.lsp.servers.gopls')
  require('config.plugins.lsp.servers.sumneko_lua')
  require('config.plugins.lsp.servers.html')
  require('config.plugins.lsp.servers.bash')
  require('config.plugins.lsp.servers.json')
  require('config.plugins.lsp.servers.yaml')
  require('config.plugins.lsp.servers.docker')
  require('config.plugins.lsp.servers.sql')
end

return M

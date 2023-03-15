local M = {
  'neovim/nvim-lspconfig',
  name = 'lsp',
  dependencies = { 'hrsh7th/cmp-nvim-lsp' },
}

function M.config()
  require('lspconfig.ui.windows').default_options.border = 'rounded'
  require('config.plugins.lsp.diagnostics').setup()

  require('config.plugins.lsp.servers.gopls')
  require('config.plugins.lsp.servers.lua_ls')
  require('config.plugins.lsp.servers.html')
  require('config.plugins.lsp.servers.bash')
  require('config.plugins.lsp.servers.json')
  require('config.plugins.lsp.servers.yaml')
  require('config.plugins.lsp.servers.docker')
  require('config.plugins.lsp.servers.sql')
  require('config.plugins.lsp.servers.volar')
  require('config.plugins.lsp.servers.cssls')
  require('config.plugins.lsp.servers.toml')
end

return M

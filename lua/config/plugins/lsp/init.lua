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
  -- TODO: add json support
end

return M

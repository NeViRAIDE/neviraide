local M = {
  'neovim/nvim-lspconfig',
  name = 'lsp',
  event = 'BufReadPre',
  dependencies = { 'hrsh7th/cmp-nvim-lsp' },
}

function M.config()
  local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
  if not status_ok then
    vim.notify('Problem with mason-lspconfig', 4)
    return
  end

  mason_lspconfig.setup({
    automatic_installation = true,
  })

  require('config.plugins.lsp.diagnostics').setup()

  require('config.plugins.lsp.servers.gopls')
  require('config.plugins.lsp.servers.sumneko_lua')
  require('config.plugins.lsp.servers.html')
  -- TODO: add json support
end

return M

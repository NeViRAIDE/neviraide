local M = {
  'williamboman/mason.nvim',
  dependencies = { 'williamboman/mason-lspconfig.nvim' },
  event = 'VeryLazy',
}

function M.config()
  require('mason').setup({
    ui = {
      border = 'rounded',
      icons = require('nvim-nonicons.extentions.mason').icons,
    },
  })

  local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
  if not status_ok then
    vim.notify('Problem with mason-lspconfig', 4)
    return
  end

  mason_lspconfig.setup({
    unsure_installed = {
      'gopls',
      'html',
      'sumneko_lua',
      'gopls',
      'bashls',
      'dockerls',
      'jsonls',
      'yamlls',
    },
    automatic_installation = true,
  })
end

return M

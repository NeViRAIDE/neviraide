local M = {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'jay-babu/mason-null-ls.nvim',
  },
  event = 'VeryLazy',
}

function M.config()
  require('mason').setup({
    ui = {
      border = 'rounded',
      icons = require('nvim-nonicons.extentions.mason').icons,
    },
  })

  local m_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
  if not m_lspconfig_ok then
    vim.notify('Problem with mason-lspconfig', 4)
    return
  end

  mason_lspconfig.setup({
    unsure_installed = {
      'gopls',
      'html',
      'sumneko_lua',
      'bashls',
      'dockerls',
      'jsonls',
      'yamlls',
      'volar',
    },
    automatic_installation = true,
  })

  local m_null_ls_ok, mason_null_ls = pcall(require, 'mason-null-ls')
  if not m_null_ls_ok then
    vim.notify('Problem with mason-null-ls', 4)
    return
  end
  mason_null_ls.setup({
    ensure_installed = { 'stylua', 'shfmt', 'jq', 'shellcheck', 'prettier' },
    automatic_installation = true,
  })
end

return M

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('lspconfig.ui.windows').default_options.border = 'rounded'
    require('plugins.config.lsp.diagnostic').setup()

    require('lang.lua')
    require('lang.go')
  end,
}

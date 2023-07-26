return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "SmiteshP/nvim-navbuddy",
      opts = {
        window = {
          border = 'rounded'
        }
      },
      dependencies = {
        require('plugins.navic')
      },
    }
  },
  config = function()
    -- require('lspconfig.ui.windows').default_options.border = 'rounded'
    require('lsp.diagnostic').setup()
    require('lsp.servers.lua')
    require('lsp.servers.go')
  end,
}

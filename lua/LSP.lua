return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        -- FIX: not working on click
        "SmiteshP/nvim-navic",
        opts = {
          separator = ' ▶ ',
          highlight = true,
          depth_limit = 7,
          depth_limit_indicator = "...",
          click = true
        }
      }
    },
    config = function()
      require('config.lsp.diagnostic').setup()
      require('config.lsp.servers.lua')
      require('config.lsp.servers.go')
    end,
  },
  'ray-x/lsp_signature.nvim',
}

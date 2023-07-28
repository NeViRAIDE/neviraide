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
      require('core.lsp.diagnostic').setup()
      require('core.lsp.servers.lua')
      require('core.lsp.servers.go')
    end,
  },

  'ray-x/lsp_signature.nvim',
}

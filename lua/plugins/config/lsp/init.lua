return {
  "neovim/nvim-lspconfig",

  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    {
      -- FIX: not working on click
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        {
          "SmiteshP/nvim-navic",
          opts = function()
            local options = {
              separator = ' ▶ ',
              highlight = true,
              depth_limit = 5,
              depth_limit_indicator = "...",
              click = true
            }
            return options
          end,
          config = function(opts)
            require('nvim-navic').setup(_, opts)
          end
        }
      },
    }
  },

  config = function()
    require('lspconfig.ui.windows').default_options.border = 'rounded'
    require('plugins.config.lsp.diagnostic').setup()

    require('lang.lua')
    require('lang.golang.lsp')
  end,
}

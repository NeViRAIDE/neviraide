return {
  'nvim-lualine/lualine.nvim',
  event  = "VeryLazy",
  config = function()
    local config = {
      extensions = {
        "lazy",
        'man',
        'neo-tree',
        'nvim-dap-ui',
        "quickfix",
        'symbols-outline',
        'toggleterm',
      },
      options = {
        disabled_filetypes = {
          winbar = {
            'neo-tree',
            'toggleterm',
          },
          'lspinfo',
          'mason',
          'filesystem',
          'TelescopePrompt',
          'help',
          'checkhealth',
          'neo-tree-popup',
          'nui',
        },
        component_separators = '',
        section_separators = '',
        theme = {
          normal = { c = { bg = "none" } },
          inactive = { c = { bg = "none" } },
        },
        globalstatus = true,
      },
      winbar = require("plugins.config.ui.lualine.modules.breadcrumb"),
      tabline = require("plugins.config.ui.lualine.modules.bufferline"),
      sections = require("plugins.config.ui.lualine.modules.statusline"),
    }

    require("lualine").setup(config)
  end,
}

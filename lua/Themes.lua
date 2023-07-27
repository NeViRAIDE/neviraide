return {
  { 'ellisonleao/gruvbox.nvim' },
  { 'sainnhe/everforest',      priority = 1000 },
  {
    'Mofiqul/dracula.nvim',
    priority = 1000,
    opts = {
      italic_comment = true,
    }
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    opts = {
      compile = true
    }
  },
  {
    'marko-cerovac/material.nvim',
    priority = 1000,
    opts = {
      contrast = {
        terminal = true,
        sidebars = true,
        floating_windows = true,
        cursor_line = true,
        non_current_windows = false,
        filetypes = { 'neo-tree' },
      },
      lualine_style = "stealth",
      plugins = {
        "dap",
        "gitsigns",
        "indent-blankline",
        "nvim-cmp",
        "nvim-navic",
        "nvim-web-devicons",
        "telescope",
        "which-key",
      },
    }
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "frappe",
      integrations = {
        cmp = true,
        gitsigns = true,
        indent_blankline = { enabled = true },
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = {
          enabled = true,
          style = "nvchad"
        },
        treesitter = true,
        which_key = true,
        lightspeed = true,
        ts_rainbow2 = true
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
  },
}

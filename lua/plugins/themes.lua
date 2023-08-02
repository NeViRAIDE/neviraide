return {
  {
    'ellisonleao/gruvbox.nvim',
    opts = {
      transparent_mode = vim.g.transparent_enabled,
      contrast = require('NEVIRAIDE').ui.pallete,
    },
  },

  { 'sainnhe/everforest', priority = 1000 },

  {
    'Mofiqul/dracula.nvim',
    priority = 1000,
    opts = {
      italic_comment = true,
      transparent_bg = vim.g.transparent_enabled,
    },
  },

  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    opts = {
      compile = true,
      transparent = vim.g.transparent_enabled,
    },
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
      disable = {
        colored_cursor = false, -- Disable the colored cursor
        borders = false, -- Disable borders between verticaly split windows
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false, -- Hide the end-of-buffer lines
      },
      high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false, -- Enable higher contrast text for darker style
      },
      lualine_style = 'stealth',
      plugins = {
        'dap',
        'gitsigns',
        'indent-blankline',
        'nvim-cmp',
        'nvim-navic',
        'nvim-web-devicons',
        'telescope',
        'which-key',
      },
    },
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      compile_path = vim.fn.stdpath('cache') .. '/catppuccin',
      transparent_background = vim.g.transparent_enabled,
      integrations = {
        alpha = true,
        cmp = true,
        gitsigns = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        mini = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
          },
          underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
          },
          inlay_hints = {
            background = true,
          },
        },
        noice = true,
        notify = true,
        neotree = true,
        navic = { enabled = true, custom_bg = 'NONE' },
        semantic_tokens = true,
        telescope = {
          enabled = true,
          style = 'nvchad',
        },
        which_key = true,
        lightspeed = true,
        treesitter_context = true,
        treesitter = true,
        ts_rainbow2 = true,
        vimwiki = true,
        dap = {
          enabled = true,
          enable_ui = true, -- enable nvim-dap-ui
        },
      },
    },
  },

  {
    'folke/tokyonight.nvim',
    priority = 1000,
    opts = {
      transparent = vim.g.transparent_enabled,
      day_brightness = 0.1,
    },
  },

  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    opts = {
      options = {
        transparency = vim.g.transparent_enabled,
      },
    },
  },
}

return {
  name = 'Catppuccin',
  colors = {
    { bg = 'dark', name = 'Frappe', cmd = 'catppuccin-frappe' },
    { bg = 'dark', name = 'Macchiato', cmd = 'catppuccin-macchiato' },
    { bg = 'dark', name = 'Mocha', cmd = 'catppuccin-mocha' },
    { bg = 'light', name = 'Latte', cmd = 'catppuccin-latte' },
  },
  plugin = {
    'catppuccin/nvim',
    version = '*',
    name = 'catppuccin',
    opts = {
      compile_path = vim.fn.stdpath('cache') .. '/catppuccin',
      transparent_background = NEVIRAIDE().transparency,
      integrations = {
        dropbar = { enabled = true, color_mode = true },
        cmp = true,
        gitsigns = true,
        indent_blankline = { enabled = true, colored_indent_levels = true },
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
        telescope = { enabled = true, style = 'nvchad' },
        which_key = true,
        lightspeed = true,
        octo = true,
        lsp_trouble = true,
        treesitter_context = true,
        treesitter = true,
        ts_rainbow2 = true,

        vimwiki = true,
        dap = { enabled = true, enable_ui = true },
      },
    },
  },
}

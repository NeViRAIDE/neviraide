return {
  name = 'Material',
  colors = {
    { bg = 'dark', name = 'Darker', cmd = 'material-darker' },
    { bg = 'dark', name = 'Deep Ocean', cmd = 'material-deep-ocean' },
    { bg = 'dark', name = 'Oceanic', cmd = 'material-oceanic' },
    { bg = 'dark', name = 'Palenight', cmd = 'material-palenight' },
    { bg = 'light', name = 'Lighter', cmd = 'material-lighter' },
  },
  plugin = {
    'marko-cerovac/material.nvim',
    version = '*',
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
}

return {
  'uga-rosa/ccc.nvim',
  event = { 'BufRead', 'BufNewFile' },
  opts = function()
    -- local picker = require('ccc').picker

    return {
      -- pickers = {
      -- picker.hex,
      -- picker.css_rgb,
      -- picker.css_hsl,
      -- picker.css_hwb,
      -- picker.css_lab,
      -- picker.css_lch,
      -- picker.css_oklab,
      -- picker.css_oklch,
      -- picker.custom_entries(require('neviraide-ui.themes.colors').palette),
      -- },
      win_opts = {
        border = vim.g.b,
      },
      highlighter = {
        auto_enable = true,
        excludes = { 'neo-tree' },
        lsp = true,
      },
    }
  end,
}

local ui = require('NEVIRAIDE')

return {
  name = 'Everforest',
  colors = {
    { bg = 'dark', name = 'Soft', cmd = 'everforest', pallete = 'soft' },
    { bg = 'dark', name = 'Medium', cmd = 'everforest', pallete = 'medium' },
    { bg = 'dark', name = 'Hard', cmd = 'everforest', pallete = 'hard' },
    { bg = 'light', name = 'Soft', cmd = 'everforest', pallete = 'soft' },
    { bg = 'light', name = 'Medium', cmd = 'everforest', pallete = 'medium' },
    { bg = 'light', name = 'Hard', cmd = 'everforest', pallete = 'hard' },
  },
  -- plugin = {
  --   'sainnhe/everforest',
  --   version = '*',
  --   opts = {},
  -- },
  plugin = {
    'neanias/everforest-nvim',
    version = '*',
    opts = {
      background = ui.pallete,
      ---How much of the background should be transparent. 2 will have more UI
      transparent_background_level = 0,
      italics = true,
      disable_italic_comments = false,
      sign_column_background = 'none',
      ---The contrast of line numbers, indent lines, etc. Options are `"high"` or `"low"` (default).
      ui_contrast = 'low',
      dim_inactive_windows = false,
      diagnostic_text_highlight = false,
      diagnostic_virtual_text = 'coloured',
      diagnostic_line_highlight = true,
      spell_foreground = true,
    },
    config = function(_, opts) require('everforest').setup(opts) end,
  },
}

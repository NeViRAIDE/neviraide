-- NOTE: add?! for what?!
-- _G.yes = true
-- _G.no = false

-- TODO: reload lazy when changed
return {
  theme = 'everforest',
  background = 'dark',
  pallete = 'dark',
  hl_add = {},
  hl_override = {},
  theme_toggle = { 'everforest', 'everforest_light' },
  lsp_semantic_tokens = true, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens
  changed_themes = {},

  telescope = {
    style = 'bordered',
  },
  cmp = {
    icons = true,
    lspkind_text = true,
    style = 'default', -- default/flat_light/flat_dark/atom/atom_colored
    border_color = 'grey_fg', -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = 'simple', -- colored / simple
  },

  transparency = false,

  numbers = true,
  relative_numbers = true,

  cursor_line = true,
  cursor_column = false,

  indents = 4,

  ---Borders for all floating windows and popups.
  ---• "none": No border.
  ---• "single": A single line box.
  ---• "double": A double line box.
  ---• "rounded": Like "single", but with rounded corners
  ---• "solid": Adds padding by a single whitespace cell.
  ---• "shadow": A drop shadow effect by blending with the background.
  ---@type string
  border = 'rounded',

  gitsigns_current_line_blame = false,
  gitsigns_signs = true,

  -- TODO: how to change font from nvim
  font = {
    font_family = 'JetBrainsMono Nerd Font',
    font_size = '14.0',
  },

  lsp_inlay_hints = true,

  diagnostic_virtual_text = false,
  diagnostic_signs = true,
}

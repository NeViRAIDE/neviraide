return {
  theme = 'everforest',

  transparency = false,

  numbers_enabled = true,
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
  ---@type 'none'|'single'|'double'|'rounded'|'solid'|'shadow'
  border = 'single',
  ---@type string
  borderchars = '{ "─", "│", "─", "│", "┌", "┐", "┘", "└" }',

  nonicons = true,

  -- TODO: do for git and lsp
  gitsigns_current_line_blame = false,
  gitsigns_signs = true,

  lsp_inlay_hints = true,

  diagnostic_virtual_text = false,
  diagnostic_signs = true,
}

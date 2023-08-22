-- TODO: reload lazy when changed
return {
  dashboard_on_startup = true,

  theme = 'tokyonight-storm',
  background = 'dark',
  pallete = 'soft',

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
  -- TODO: add gitsigns (current line blame)

  -- TODO: how to change font from nvim
  font = {
    font_family = 'JetBrainsMono Nerd Font',
    font_size = '14.0',
  },

  lsp = {
    diagnostic = {
      virtual_text = false,
      diagnostic_signs = true,
    },
    inlay_hints = true,
  },
}
-- TODO: add kitty settings (font, size, family)

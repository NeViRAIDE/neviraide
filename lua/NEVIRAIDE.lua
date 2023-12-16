---@class NeviraideConfig
return {
  lang = { 'lua', 'rust', 'go' },

  theme = 'Gruvbox-Retro',

  transparency = false,

  ---Print the line number in front of each line.
  numbers_enabled = true,

  ---Show the line number relative to the line with the cursor in front of each line.
  ---Relative line numbers help you use the |count| you can precede some vertical motion commands (e.g. j k + -) with, without having to calculate it yourself.
  relative_numbers = true,

  ---Highlight the text line of the cursor with CursorLine. Useful to easily spot the cursor.  Will make screen redrawing slower. When Visual mode is active the highlighting isn't used to make it easier to see the selected text.
  ---@type boolean
  cursor_line = true,
  ---Highlight the screen column of the cursor with CursorColumn. Useful to align text. Will make screen redrawing slower.
  ---@type boolean
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
  border = 'rounded',
  ---Symbols for rendering border
  ---@type string
  borderchars = '{ "─", "│", "─", "│", "╭", "╮", "╯", "╰" }',

  nonicons = true,

  gitsigns_current_line_blame = false,
  gitsigns_signs = true,

  lsp = {
    inlay_hints = true,
    diagnostic = {
      signs = true,
      virtual_text = false,
    },
  },

  font_family = 'JetBrainsMono Nerd Font',
  font_size = 14,
}

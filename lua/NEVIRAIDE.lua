-- TODO: make all options dynamically

---@type NeviraideConfig
return {
  lang = { 'lua', 'rust', 'go' },
  theme = 'Synth-Wave',
  transparency = false,
  numbers_enabled = true,
  relative_numbers = true,
  cursor_line = true,
  cursor_column = false,
  indents = 4,
  border = 'rounded',
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
  font = {
    family = 'JetBrainsMono Nerd Font',
    size = 14,
  },
}

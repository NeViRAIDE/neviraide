-- TODO: make all options dynamically

---@type NeviraideConfig
return {
  latest_plugins = true,
  lang = { 'lua', 'rust', 'go' },
  theme = 'Gruvbox-Retro',
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
    format_before_save = true,
    inlay_hints = true,
    code_lenses = true,
    diagnostic = {
      signs = true,
      virtual_text = false,
      show_on_hover = true,
    },
  },
  font = {
    family = 'JetBrainsMono Nerd Font',
    size = 13,
  },
}

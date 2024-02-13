-- TODO: make all options dynamically

---@type NeviraideConfig
return {
  latest_stable_plugins = true,
  lang = { 'lua', 'rust', 'go' },
  theme = 'One-Dark',
  transparency = false,
  numbers_enabled = true,
  relative_numbers = true,
  cursor_line = true,
  cursor_column = false,
  indents = 4,
  border = 'rounded',
  borderchars = '{ "─", "│", "─", "│", "╭", "╮", "╯", "╰" }',
  nonicons = true,
  gitsigns = {
    enable_g_signs = true,
    enable_current_line_blame = false,
  },
  lsp = {
    format_before_save = true,
    inlay_hints = true,
    code_lenses = true,
    diagnostic = {
      enable_d_signs = true,
      virtual_text = false,
      show_on_hover = true,
    },
  },
  font = {
    family = 'JetBrainsMono Nerd Font',
    size = 13,
  },
}

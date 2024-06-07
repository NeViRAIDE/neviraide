-- TODO: make all options dynamically

---@type NeviraideConfig
return {
  language = 'ru',
  latest_stable_plugins = true,
  programming = { 'lua', 'rust', 'go' },
  git = {
    gitsigns = {
      enable_g_signs = true,
      enable_current_line_blame = false,
    },
  },
  lsp = {
    format_before_save = false,
    inlay_hints = true,
    code_lenses = true,
    diagnostic = {
      enable_d_signs = true,
      virtual_text = false,
      show_on_hover = false,
    },
  },
  ui = {
    hyde = true,
    theme = 'Dracula',
    notify = true,
    nonicons = true,
    cursor_line = true,
    cursor_column = false,
    indents = 4,
    line_numbers = {
      auto_switch_relative = true,
      numbers_enabled = true,
      relative_numbers = true,
    },
    font = {
      family = 'JetBrainsMono Nerd Font',
      size = 13,
    },
  },
}

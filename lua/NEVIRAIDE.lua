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
    format_before_save = true,
    inlay_hints = true,
    code_lenses = true,
    diagnostic = {
      enable_d_signs = true,
      virtual_text = false,
      show_on_hover = false,
    },
  },
  ui = {
    hyprdots = true,
    theme = 'Catppuccin-Mocha',
    notify = true,
    nonicons = true,
    numbers_enabled = true,
    relative_numbers = true,
    cursor_line = true,
    cursor_column = false,
    indents = 4,
    font = {
      family = 'JetBrainsMono Nerd Font',
      size = 13,
    },
  },
}

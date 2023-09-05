return {
  space_char_blankline = ' ',

  -- char_highlight_list = {
  --   'IndentBlanklineIndent1',
  --   'IndentBlanklineIndent2',
  --   'IndentBlanklineIndent3',
  --   'IndentBlanklineIndent4',
  --   'IndentBlanklineIndent5',
  --   'IndentBlanklineIndent6',
  -- },
  indentLine_enabled = 1,
  filetype_exclude = {
    'help',
    'terminal',
    'lazy',
    'lspinfo',
    'TelescopePrompt',
    'TelescopeResults',
    'mason',
    'noice',
  },
  buftype_exclude = { 'terminal', 'nofile' },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,
}

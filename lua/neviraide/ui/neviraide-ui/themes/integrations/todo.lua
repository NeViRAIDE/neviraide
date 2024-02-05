local colors =
  require('neviraide.ui.neviraide-ui.themes').get_theme_tb('base_30')

return {
  TodoBgFix = { fg = colors.black2, bg = colors.red, bold = true },
  TodoBgHack = { fg = colors.black2, bg = colors.orange, bold = true },
  TodoBgNote = { fg = colors.black2, bg = colors.white, bold = true },
  TodoBgPerf = { fg = colors.black2, bg = colors.purple, bold = true },
  TodoBgTest = { fg = colors.black2, bg = colors.purple, bold = true },
  TodoBgTodo = { fg = colors.black2, bg = colors.yellow, bold = true },
  TodoBgWarn = { fg = colors.orange, bold = true },
  TodoFgFix = { fg = colors.red },
  TodoFgHack = { fg = colors.orange },
  TodoFgNote = { fg = colors.white },
  TodoFgPerf = { fg = colors.purple },
  TodoFgTest = { fg = colors.purple },
  TodoFgTodo = { fg = colors.yellow },
  TodoFgWarn = { fg = colors.orange },
  TodoSignFix = { link = 'TodoFgFix' },
  TodoSignHack = { link = 'TodoFgHack' },
  TodoSignNote = { link = 'TodoFgNote' },
  TodoSignPerf = { link = 'TodoFgPerf' },
  TodoSignTest = { link = 'TodoFgTest' },
  TodoSignTodo = { link = 'TodoFgTodo' },
  TodoSignWarn = { link = 'TodoFgWarn' },
}

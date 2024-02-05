local colors =
  require('neviraide.ui.neviraide-ui.themes').get_theme_tb('base_30')

return {
  WhichKey = { fg = colors.blue, bold = true },
  WhichKeyFloat = { link = 'NormalFloat' },
  WhichKeySeparator = { fg = colors.light_grey },
  WhichKeyDesc = { fg = colors.red },
  WhichKeyGroup = { fg = colors.green },
  WhichKeyValue = { fg = colors.green },
}

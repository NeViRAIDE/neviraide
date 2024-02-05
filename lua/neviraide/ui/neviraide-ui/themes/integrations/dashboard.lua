local colors =
  require('neviraide.ui.neviraide-ui.themes').get_theme_tb('base_30')

return {
  NeviraideDashboardAscii = {
    bg = 'none',
    fg = colors.green,
  },

  NeviraideDashboardButtons = {
    fg = colors.grey_fg,
    bg = 'none',
  },

  NeviraideDashboardVimver = {
    fg = colors.one_bg2,
    bg = 'none',
    italic = true,
    bold = false,
  },

  DashboardCursorLine = {
    bold = true,
    fg = colors.orange,
    bg = 'none',
  },
}

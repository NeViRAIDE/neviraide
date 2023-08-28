return {
  name = 'Settings ',
  b = {
    '<cmd>lua require"neviraide-ui.themes".toggle_transparency()<cr>',
    'Background transparency',
  },
  c = {
    name = 'Cursor',
    c = {
      '<cmd>lua require"neviraide-ui.utils.settings".toggle_cursor_column()<cr>',
      'Toggle cursor column',
    },
    l = {
      '<cmd>lua require"neviraide-ui.utils.settings".toggle_cursor_line()<cr>',
      'Toggle cursor line',
    },
  },
  t = {
    '<cmd>lua require("neviraide-ui.utils.change_theme")()<cr>',
    'Themes',
  },
  n = {
    name = 'Numbers',
    n = {
      '<cmd>lua require"neviraide-ui.utils.settings".toggle_numbers()<cr>',
      'Toggle numbers',
    },
    r = {
      '<cmd>lua require"neviraide-ui.utils.settings".toggle_relative_numbers()<cr>',
      'Toggle relative numbers',
    },
  },
}

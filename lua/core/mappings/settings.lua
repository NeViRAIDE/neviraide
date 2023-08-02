return {
  name = 'Settings ',
  c = {
    '<cmd>lua require("core.utils.settings.change_theme")()<cr>',
    'Colorscheme',
  },
  n = {
    '<cmd>lua require"core.utils.settings".toggle_numbers()<cr>',
    'Toggle numbers',
  },
  r = {
    '<cmd>lua require"core.utils.settings".toggle_relative_numbers()<cr>',
    'Toggle relative numbers',
  },
  t = {
    '<cmd>lua require"core.utils.settings".toggle_transparency()<cr>',
    'Toggle background transparency',
  },
}

local icon = require('neviraide-ui.icons.utils').icon

return {
  name = 'TODO notes' .. icon('', 'tasklist', 1),
  l = {
    ':TodoTelescope theme=ivy initial_mode=normal previewer=false layout_config={bottom_pane={height=12}}<cr>',
    'Notes list ',
  },
  f = {
    'OFIX: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'Fix ',
  },
  t = {
    'OTODO: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'To do ',
  },
  h = {
    'OHACK: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'Hack ',
  },
  w = {
    'OWARN: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'Warning',
  },
  p = {
    'OPERF: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'Performance ',
  },
  n = {
    'ONOTE: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'Note ',
  },
}

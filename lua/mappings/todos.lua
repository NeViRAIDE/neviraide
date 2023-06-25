return {
  name = 'TODO notes',
  l = {
    ':TodoTelescope theme=ivy initial_mode=normal previewer=false layout_config={bottom_pane={height=12}}<cr>',
    'Notes list ',
  },
  f = {
    'OFIX: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'FIX ',
  },
  t = {
    'OTODO: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'TODO ',
  },
  h = {
    'OHACK: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'HACK ',
  },
  w = {
    'OWARN: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'WARN ',
  },
  p = {
    'OPERF: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'PERF ',
  },
  n = {
    'ONOTE: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'NOTE ',
  },
}

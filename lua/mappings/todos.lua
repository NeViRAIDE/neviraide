return {
  name = 'TODO notes',
  l = {
    ':TodoTelescope theme=ivy initial_mode=normal previewer=false layout_config={bottom_pane={height=12}} border={} borderchars={"","","","","","","",""}<cr>',
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

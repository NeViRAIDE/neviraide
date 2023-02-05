return {
  name = 'TODO notes ' .. icon('tasklist', '', ''),
  l = {
    ':TodoTelescope theme=ivy initial_mode=normal previewer=false layout_config={bottom_pane={height=12}}<cr>',
    'Notes list ' .. icon('tasklist', '', ''),
  },
  f = {
    'OFIX: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'FIX ' .. icon('meter', '', ''),
  },
  t = {
    'OTODO: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'TODO ' .. icon('check-circle', '', ''),
  },
  h = {
    'OHACK: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'HACK ' .. icon('flame', '', ''),
  },
  w = {
    'OWARN: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'WARN ' .. icon('alert', '', ''),
  },
  p = {
    'OPERF: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'PERF ' .. icon('stopwatch', '', ''),
  },
  n = {
    'ONOTE: <esc>:lua require("Comment.api").toggle.linewise.current()<cr>A',
    'NOTE ' .. icon('note', '', ''),
  },
}

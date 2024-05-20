local icon = require('stigmata.utils').icon

local api = require('Comment.api')

local function create_todo_comment(text)
  api.insert.linewise.above()

  local current_line = vim.api.nvim_win_get_cursor(0)[1] - 1
  local commented_line =
    vim.api.nvim_buf_get_lines(0, current_line, current_line + 1, false)[1]
  vim.api.nvim_buf_set_lines(
    0,
    current_line,
    current_line + 1,
    false,
    { commented_line .. text:upper() .. ': ' }
  )

  local line_length =
    #vim.api.nvim_buf_get_lines(0, current_line, current_line + 1, false)[1]
  vim.api.nvim_win_set_cursor(0, { current_line + 1, line_length })
end

return {
  name = 'TODO notes' .. icon('', 'tasklist', 1),
  l = {
    ':TodoTelescope theme=ivy initial_mode=normal previewer=false layout_config={bottom_pane={height=15}}<cr>',
    'Notes list' .. icon('', 'tasklist', 1),
  },
  a = {
    name = 'Add',
    p = {
      name = 'Found a problem' .. icon('', 'bug', 1),
      b = { function() create_todo_comment('bug') end, 'Bug' },
      f = { function() create_todo_comment('fix') end, 'Fix' },
      I = { function() create_todo_comment('fixit') end, 'Fixit' },
      M = { function() create_todo_comment('fixme') end, 'Fixme' },
      i = { function() create_todo_comment('issue') end, 'Issue' },
    },
    t = {
      function() create_todo_comment('todo') end,
      'To do' .. icon('', 'check', 1),
    },
    h = {
      function() create_todo_comment('hack') end,
      'Hack' .. icon('', 'flame', 1),
    },
    a = {
      name = 'Attention' .. icon('', 'alert', 1),
      w = { function() create_todo_comment('warn') end, 'Warning' },
      x = { function() create_todo_comment('xxx') end, 'XXX' },
    },
    b = {
      name = 'Make it better' .. icon('', 'stopwatch', 1),
      p = { function() create_todo_comment('perf') end, 'Performance' },
      o = { function() create_todo_comment('optim') end, 'Optimize' },
    },
    f = {
      name = 'To not forget' .. icon('', 'note', 1),
      i = { function() create_todo_comment('info') end, 'Information' },
      n = { function() create_todo_comment('note') end, 'Note' },
    },
    T = {
      name = 'Test' .. icon('⏲', 'hourglass', 1),
      t = { function() create_todo_comment('test') end, 'Testing' },
      f = { function() create_todo_comment('failde') end, 'Failed' },
      p = { function() create_todo_comment('passed') end, 'Passed' },
    },
  },
}

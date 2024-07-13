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
  { '<leader>un', group = 'TODO notes', icon = icon('', 'tasklist') },
  {
    '<leader>unl',
    '<cmd>TodoTelescope theme=ivy initial_mode=normal previewer=false layout_config={bottom_pane={height=15}}<cr>',
    desc = 'Notes list',
    icon = icon('', 'tasklist'),
  },
  { '<leader>una', group = 'Add' },
  { '<leader>unap', group = 'Found a problem', icon = icon('', 'bug') },
  { '<leader>unapb', function() create_todo_comment('bug') end, desc = 'Bug' },
  { '<leader>unapf', function() create_todo_comment('fix') end, desc = 'Fix' },
  {
    '<leader>unapI',
    function() create_todo_comment('fixit') end,
    desc = 'Fixit',
  },
  {
    '<leader>unapM',
    function() create_todo_comment('fixme') end,
    desc = 'Fixme',
  },
  {
    '<leader>unapi',
    function() create_todo_comment('issue') end,
    desc = 'Issue',
  },
  {
    '<leader>unat',
    function() create_todo_comment('todo') end,
    desc = 'To do',
    icon = icon('', 'check'),
  },
  {
    '<leader>unah',
    function() create_todo_comment('hack') end,
    desc = 'Hack',
    icon = icon('', 'flame'),
  },
  { '<leader>unaa', group = 'Attention', icon = icon('', 'alert') },
  {
    '<leader>unaaw',
    function() create_todo_comment('warn') end,
    desc = 'Warning',
  },
  { '<leader>unaax', function() create_todo_comment('xxx') end, desc = 'XXX' },
  {
    '<leader>unab',
    group = 'Make it better',
    icon = icon('', 'stopwatch'),
  },
  {
    '<leader>unabp',
    function() create_todo_comment('perf') end,
    desc = 'Performance',
  },
  {
    '<leader>unabo',
    function() create_todo_comment('optim') end,
    desc = 'Optimize',
  },
  { '<leader>unaf', group = 'To not forget', icon = icon('', 'note') },
  {
    '<leader>unafi',
    function() create_todo_comment('info') end,
    desc = 'Information',
  },
  {
    '<leader>unafn',
    function() create_todo_comment('note') end,
    desc = 'Note',
  },
  { '<leader>unaT', group = 'Test', icon = icon('⏲', 'hourglass') },
  {
    '<leader>unaTt',
    function() create_todo_comment('test') end,
    desc = 'Testing',
  },
  {
    '<leader>unaTf',
    function() create_todo_comment('failde') end,
    desc = 'Failed',
  },
  {
    '<leader>unaTp',
    function() create_todo_comment('passed') end,
    desc = 'Passed',
  },
}

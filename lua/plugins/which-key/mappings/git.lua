local icon = require('neviraide-ui.icons.utils').icon

return {
  name = 'Git' .. icon('', 'mark-github', 1, 1),
  s = {
    name = 'Signs' .. icon('', 'milestone', 1, 1),
    n = { '<cmd>Gitsigns next_hunk<cr>', 'Next hunk' },
    p = { '<cmd>Gitsigns prev_hunk<cr>', 'Previous hunk' },
    b = {
      '<cmd>Gitsigns toggle_current_line_blame<cr>',
      'Toggle current line blame',
    },
  },
  d = {
    name = 'Diff' .. icon('', 'diff', 1, 1),
    o = { '<cmd>DiffviewOpen<cr>', 'Open' },
    c = { '<cmd>DiffviewClose<cr>', 'Close' },
    h = { '<cmd>DiffviewFileHistory<cr>', 'File history' },
    t = { '<cmd>DiffviewToggleFiles<cr>', 'Toggle files' },
  },
}

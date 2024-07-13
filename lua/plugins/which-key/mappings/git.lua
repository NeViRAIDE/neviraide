local icon = require('stigmata.utils').icon

return {
  { '<leader>g', group = 'Git', icon = icon('', 'mark-github') },
  { '<leader>gs', group = 'Signs', icon = icon('', 'milestone') },
  { '<leader>gsn', '<cmd>Gitsigns next_hunk<cr>', desc = 'Next hunk' },
  { '<leader>gsp', '<cmd>Gitsigns prev_hunk<cr>', desc = 'Previous hunk' },
  {
    '<leader>gsb',
    '<cmd>Gitsigns toggle_current_line_blame<cr>',
    desc = 'Toggle current line blame',
  },
  { '<leader>gd', group = 'Diff', icon = icon('', 'diff') },
  { '<leader>gdo', '<cmd>DiffviewOpen<cr>', desc = 'Open' },
  { '<leader>gdc', '<cmd>DiffviewClose<cr>', desc = 'Close' },
  { '<leader>gdh', '<cmd>DiffviewFileHistory<cr>', desc = 'File history' },
  { '<leader>gdt', '<cmd>DiffviewToggleFiles<cr>', desc = 'Toggle files' },
}

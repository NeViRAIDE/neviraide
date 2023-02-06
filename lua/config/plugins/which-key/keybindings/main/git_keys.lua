return {
  name = 'GIT ' .. icon('git-branch', '', ''),
  l = { ':lua lazygit_toggle()<CR>', 'Lazygit' },
  s = { ':NeoTreeFloatToggle git_status<CR>', 'Status' },
  r = { ':Gitsigns reset_hunk<cr>', 'Reset hunk' },
  b = { ':Gitsigns blame_line<cr>', 'Blame line' },
  d = { ':Gitsigns diffthis<cr>', 'Diff this ' .. icon('diff', '', '') },
  n = { ':Gitsigns next_hunk<cr>', 'Go to next hunk' },
  p = { ':Gitsigns prev_hunk<cr>', 'Go to previous hunk' },
  P = { ':Gitsigns preview_hunk<cr>', 'Preview hunk' },
  t = {
    name = 'Toggle',
    l = { ':Gitsigns toggle_linehl<CR>', 'Line highlighting' },
    n = { ':Gitsigns toggle_numhl<CR>', 'Line numbers highlighting' },
    s = { ':Gitsigns toggle_signs<CR>', 'Signs' },
    w = { ':Gitsigns toggle_word_diff<CR>', 'Word diff' },
    d = { ':Gitsigns toggle_deleted<CR>', 'Deleted' },
    b = {
      ':Gitsigns toggle_current_line_blame<CR>',
      'Current line blame',
    },
  },
}

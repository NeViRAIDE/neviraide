local i = require('stigmata.utils').icon

return {
  mode = { 'v' },
  -- ['<c-/>'] = {
  --   "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  --   'Toggle comment' .. i('', 'comment', 1),
  -- },
  {
    'p',
    'p:let @+=@0<CR>:let @"=@0<CR>',
    desc = 'Paste (dont copy replaced text)',
  },
  { '<leader>t', group = 'Translate', icon = '󰗊 ' },
  {
    '<leader>tt',
    '<cmd>Translate ' .. vim.g.lang .. '<cr>',
    desc = 'Current selection',
  },
  {
    '<leader>tb',
    '<cmd>Translate '
      .. vim.g.lang
      .. ' -parse_before=trim -parse_after=window -output=split<cr>',
    desc = 'Split (bottom)',
  },
}

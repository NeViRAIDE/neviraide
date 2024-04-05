local i = require('neviraide-ui.icons.utils').icon

return {
  ['<c-/>'] = {
    "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    'Toggle comment' .. i('', 'comment', 1),
  },
  p = {
    'p:let @+=@0<CR>:let @"=@0<CR>',
    'Paste (dont copy replaced text)',
  },
  ['<leader>'] = {
    t = {
      name = 'Translate',
      t = {
        '<cmd>Translate ' .. vim.g.lang .. '<cr>',
        'Current selection',
      },
      b = {
        '<cmd>Translate '
          .. vim.g.lang
          .. ' -parse_before=trim -parse_after=window -output=split<cr>',
        'Split (bottom)',
      },
    },
  },
}

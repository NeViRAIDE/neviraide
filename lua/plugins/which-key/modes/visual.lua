local i = require('neviraide.ui.neviraide-ui.icons.utils').icon

return {
  ['<c-/>'] = {
    "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    'Toggle comment' .. i('', 'comment', 1),
  },
  p = {
    'p:let @+=@0<CR>:let @"=@0<CR>',
    'Paste (dont copy replaced text)',
  },
}

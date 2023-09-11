local icon = require('neviraide-ui.icons.utils').icon

return function(bufnr)
  require('neviraide.utils').wk_reg({
    ['<leader>'] = {
      M = {
        '<cmd>MarkdownPreviewToggle<cr>',
        'Markdown preview' .. icon('', 'browser', 1),
      },
    },
  }, { buffer = bufnr, mode = 'n' })
end

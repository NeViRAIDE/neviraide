local icon = require('neviraide-ui.icons.utils').icon

-- FIX: remove after go out from .md
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

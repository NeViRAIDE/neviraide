local wk = require('which-key')
local icon = require('neviraide-ui.icons.utils').icon

return function(bufnr)
  wk.register({
    ['<leader>'] = {
      M = {
        '<cmd>MarkdownPreviewToggle<cr>',
        'Markdown preview' .. icon('', 'browser', 1),
      },
    },
  }, { buffer = bufnr, mode = 'n' })
end

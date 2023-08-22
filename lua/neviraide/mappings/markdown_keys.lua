return function(bufnr)
  require('neviraide.utils').wk_reg({
    ['<leader>'] = {
      name = 'Plugins and features ',
      m = {
        '<cmd>MarkdownPreviewToggle<cr>',
        'Toggle preview markdown ',
      },
    },
  }, { buffer = bufnr, mode = 'n' })
end


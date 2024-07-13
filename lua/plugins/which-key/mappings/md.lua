local wk = require('which-key')
local icon = require('stigmata.utils').icon

return function(bufnr)
  wk.add({
    {
      '<leader>M',
      '<cmd>MarkdownPreviewToggle<cr>',
      desc = 'Markdown preview',
      icon = icon('', 'browser'),
      buffer = bufnr,
    },
  })
end

return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()

    local ok, wk = pcall(require, 'which-key')
    local i = require('stigmata.utils').icon

    if ok then
      wk.register({
        ['<c-/>'] = {
          function() require('Comment.api').toggle.linewise.current() end,
          'Toggle comment' .. i('', 'comment', 1),
        },
      }, { mode = 'n' })

      wk.register({
        ['<c-/>'] = {
          "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
          'Toggle comment' .. i('', 'comment', 1),
        },
      }, { mode = 'v' })
    end
  end,
}

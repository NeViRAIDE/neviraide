return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()

    local ok, wk = pcall(require, 'which-key')
    local i = require('stigmata.utils').icon

    if ok then
      wk.add({
        {
          '<c-/>',
          rhs = function() require('Comment.api').toggle.linewise.current() end,
          desc = 'Toggle comment' .. i('', 'comment', 1),
          mode = 'n',
        },
      })

      wk.add({
        {
          '<c-/>',
          "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
          desc = 'Toggle comment' .. i('', 'comment', 1),
          mode = 'v',
        },
      })
    end
  end,
}

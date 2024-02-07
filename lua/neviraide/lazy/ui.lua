local util = require('neviraide.utils')

return {
  {
    'rcarriga/nvim-notify',
    opts = function()
      dofile(vim.g.ntc .. 'notify')
      return { minimum_width = 10 }
    end,
  },
  {
    'nvim-tree/nvim-web-devicons',
    opts = function() return { override = util.icons().global } end,
    config = function(_, opts)
      dofile(vim.g.ntc .. 'icons')
      require('nvim-web-devicons').setup(opts)
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = util.opt('ui.indent-blankline'),
    config = util.con('ui.indent-blankline'),
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
  },
  {
    'folke/todo-comments.nvim',
    cmd = 'TodoTelescope',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = require('plugins.todo-comments.options'),
  },
  {
    'folke/which-key.nvim',
    keys = require('plugins.which-key.keys'),
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = function() return require('plugins.which-key.options') end,
  },
}

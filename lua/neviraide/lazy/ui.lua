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
    opts = function()
      return { override = require('neviraide.utils').icons().global }
    end,
    config = function(_, opts)
      dofile(vim.g.ntc .. 'icons')
      require('nvim-web-devicons').setup(opts)
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = require('plugins.ui.indent-blankline.options'),
    config = require('plugins.ui.indent-blankline.config'),
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
    'lewis6991/gitsigns.nvim',
    ft = { 'gitcommit', 'diff' },
    init = require('plugins.gitsigns.start'),
    opts = require('plugins.gitsigns.options'),
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

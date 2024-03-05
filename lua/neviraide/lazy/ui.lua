return {
  {
    'RAprogramm/neviraide-ui.nvim',
    dev = true,
    event = 'VeryLazy',
    dependencies = {},
    opts = {
      hyprdots = true,
    },
  },
  {
    'rcarriga/nvim-notify',
    init = require('plugins.ui.notify'),
    opts = require('plugins.ui.notify.options'),
  },
  {
    'nvim-tree/nvim-web-devicons',
    opts = require('plugins.ui.devicons.options'),
    config = require('plugins.ui.devicons.config'),
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    -- opts = require('plugins.ui.indent-blankline.options'),
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
    'folke/which-key.nvim',
    keys = require('plugins.which-key.keys'),
    init = require('plugins.which-key'),
    opts = require('plugins.which-key.options'),
  },
}

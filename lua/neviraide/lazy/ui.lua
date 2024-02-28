return {
  {
    'RAprogramm/neviraide-ui.nvim',
    dev = true,
    event = 'VeryLazy',
    dependencies = {
      {
        'rcarriga/nvim-notify',
        init = require('plugins.ui.notify'),
        opts = require('plugins.ui.notify.options'),
      },
    },
    -- opts = {
    --   hyprdots = true,
    --   -- cmdline = { enabled = false },
    -- },
  },
  {
    'nvim-tree/nvim-web-devicons',
    opts = require('plugins.ui.devicons.options'),
    config = require('plugins.ui.devicons.config'),
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
    init = require('plugins.which-key'),
    opts = require('plugins.which-key.options'),
  },
}

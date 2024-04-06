return {
  {
    'RAprogramm/neviraide-ui.nvim',
    dev = true,
    event = 'VeryLazy',
    dependencies = {},
    opts = {
      hyprdots = true,
      notify = true,
    },
  },
  {
    'nvim-tree/nvim-web-devicons',
    opts = require('plugins.ui.devicons.options'),
    config = require('plugins.ui.devicons.config'),
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufReadPost', 'BufNewFile' },
    config = require('plugins.ui.indent-blankline.config'),
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
  },
}

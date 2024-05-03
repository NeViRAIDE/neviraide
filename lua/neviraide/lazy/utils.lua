return {
  { 'wakatime/vim-wakatime', event = 'VeryLazy' },
  { 'ggandor/lightspeed.nvim', event = { 'BufReadPost', 'BufNewFile' } },
  {
    'RAprogramm/nekifoch',
    dev = true,
    event = { 'BufReadPost', 'BufNewFile' },
    keys = { '<leader>sf', 'Nekifoch' },
    opts = {
      which_key = {
        enable = true,
      },
      borders = vim.g.b,
    },
  },
  {
    'numToStr/Comment.nvim',
    config = require('plugins.comment.config'),
  },
  {
    'NvChad/nvterm',
    opts = {
      terminals = {
        type_opts = {
          float = { border = vim.g.b },
        },
      },
    },
    config = function(_, opts)
      require('neviraide-ui.themes.term')
      require('nvterm').setup(opts)
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && ./install.sh',
    ft = { 'markdown' },
    config = require('plugins.markdown-preview.config'),
  },
  {
    'uga-rosa/ccc.nvim',
    event = { 'BufRead', 'BufNewFile' },
    opts = require('plugins.ccc.options'),
  },
  {
    'nvim-neotest/neotest',
    ft = 'go, rust',
    dependencies = { 'nvim-neotest/neotest-go', 'rouge8/neotest-rust' },
    config = require('plugins.neotest.config'),
  },
  {
    'epwalsh/pomo.nvim',
    cmd = { 'TimerStart', 'TimerRepeat' },
    opts = require('plugins.pomo-timer.options'),
  },

  {
    'akinsho/toggleterm.nvim',
    cmd = { 'ToggleTerm' },
    opts = {},
  },
  {
    'uga-rosa/translate.nvim',
    cmd = 'Translate',
    opts = require('plugins.translate.options'),
  },

  {
    'folke/todo-comments.nvim',
    cmd = 'TodoTelescope',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = require('plugins.todo-comments.options'),
    config = require('plugins.todo-comments.config'),
  },
}

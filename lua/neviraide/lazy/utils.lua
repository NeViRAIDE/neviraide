return {
  { 'wakatime/vim-wakatime', event = 'VeryLazy' },
  { 'ggandor/lightspeed.nvim', event = { 'BufReadPost', 'BufNewFile' } },
  {
    'RAprogramm/nekifoch',
    dev = true,
    -- cmd = 'Nekifoch',
    event = 'VeryLazy',
    opts = {
      which_key = {
        enable = true,
      },
    },
  },
  {
    'numToStr/Comment.nvim',
    keys = require('plugins.comment.keys'),
    config = function(_, opts) require('Comment').setup(opts) end,
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
    opts = {
      preset = {
        output = {
          floating = {
            relative = 'cursor',
            style = 'minimal',
            width = nil,
            height = nil,
            row = 1,
            col = 1,
            border = vim.g.b,
            filetype = 'translate',
            zindex = 50,
          },
        },
      },
    },
  },
}

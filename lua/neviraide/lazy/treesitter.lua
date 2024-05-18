return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    event = { 'BufReadPost', 'BufNewFile' },
    build = require('plugins.treesitter.build'),
    dependencies = {
      'windwp/nvim-ts-autotag',
      'nvim-treesitter/nvim-treesitter-context',
      -- {
      --     "nvim-treesitter/nvim-treesitter-context",
      --     event = "BufReadPost",
      --     opts = {
      --       throttle = true,
      --       max_lines = 0,
      --       patterns = {
      --         default = {
      --           "class",
      --           "function",
      --           "method",
      --         },
      --       },
      --     },
      --   },
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    opts = require('plugins.treesitter.opts'),
    config = require('plugins.treesitter.config'),
  },
}

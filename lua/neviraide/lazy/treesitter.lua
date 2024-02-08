return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = { 'windwp/nvim-ts-autotag' },
    opts = require('plugins.treesitter.opts'),
    config = require('plugins.treesitter.config'),
  },
  {
    'luckasRanarison/tree-sitter-hypr',
    enabled = require('plugins.treesitter-hypr.enabled'),
    event = 'BufRead */hypr/*.conf',
    build = ':TSUpdate hypr',
    config = require('plugins.treesitter-hypr.config'),
  },
}

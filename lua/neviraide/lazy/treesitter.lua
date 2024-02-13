return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    event = { 'BufReadPost', 'BufNewFile' },
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })()
    end,
    dependencies = { 'windwp/nvim-ts-autotag' },
    opts = require('plugins.treesitter.opts'),
    config = require('plugins.treesitter.config'),
  },
}

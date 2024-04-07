return {
  {
    'miversen33/netman.nvim',
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    opts = require('plugins.neotree.options'),
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    opts = require('plugins.telescope.options'),
    config = require('plugins.telescope.config'),
  },
  {
    'hrsh7th/nvim-cmp',
    version = false,
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = 'make install_jsregexp',
        dependencies = 'rafamadriz/friendly-snippets',
        opts = require('plugins.luasnip.options'),
        config = require('plugins.luasnip.config'),
      },
      {
        'windwp/nvim-autopairs',
        opts = require('plugins.autopairs.options'),
        config = require('plugins.autopairs.config'),
      },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'lukas-reineke/cmp-under-comparator' },
      { 'FelipeLema/cmp-async-path' },
    },
    opts = require('plugins.cmp.options'),
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = require('plugins.which-key.options'),
    config = function(_, opts)
      local wk = require('which-key')
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
}

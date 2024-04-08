return {
  {
    'neovim/nvim-lspconfig',
    version = false,
    event = { 'BufReadPre', 'BufNewFile', 'BufAdd' },
    dependencies = {
      { 'Bekaboo/dropbar.nvim', opts = require('plugins.dropbar.options') },
      {
        'hrsh7th/cmp-nvim-lsp',
        cond = function() return require('neviraide.utils').has('nvim-cmp') end,
      },
      {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        build = ':MasonUpdate',
        opts = require('plugins.lsp.mason.opts'),
        config = require('plugins.lsp.mason.config'),
      },
      { 'williamboman/mason-lspconfig.nvim' },
      -- TODO: LSP_SIGNATURE realize myself
      -- {
      --   'ray-x/lsp_signature.nvim',
      --   event = 'VeryLazy',
      --   opts = {
      --     bind = true,
      --     hint_prefix = '🐼 ',
      --     hint_enable = false,
      --     floating_window = true,
      --     handler_opts = { border = vim.g.b },
      --   },
      --   config = function(_, opts) require('lsp_signature').setup(opts) end,
      -- },
    },
    config = require('plugins.lsp.lspconfig.config'),
  },
  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'williamboman/mason.nvim', 'nvimtools/none-ls.nvim' },
    config = require('plugins.lsp.null'),
  },
}

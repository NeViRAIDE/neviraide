return {
  { 'nvim-lua/plenary.nvim' },

  { 'MunifTanjim/nui.nvim' },

  { 'wakatime/vim-wakatime', event = 'VeryLazy' },

  {
    -- 'RAprogramm/nekifoch',
    dir = '~/GitHub/nvim_plugins/nekifoch.nvim',
    cmd = 'Nekifoch',
    opts = {},
  },

  {
    'nvim-tree/nvim-web-devicons',
    opts = function()
      return { override = require('neviraide.utils').icons().global }
    end,
    config = function(_, opts)
      dofile(vim.g.neviraide_themes_cache .. 'icons')
      require('nvim-web-devicons').setup(opts)
    end,
  },

  {
    'folke/noice.nvim',
    -- version = false,
    event = 'VeryLazy',
    opts = require('plugins.noice.options'),
    dependencies = {},
  },

  {
    'rcarriga/nvim-notify',
    opts = function() return require('plugins.notify.options') end,
    init = function()
      require('neviraide.utils').on_very_lazy(
        function() vim.notify = require('notify') end
      )
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = require('plugins.indent-blankline.opts'),
    config = require('plugins.indent-blankline.config'),
  },

  {
    'nvim-treesitter/nvim-treesitter',
    -- version = false,
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

  {
    'NvChad/nvterm',
    opts = {
      terminals = {
        type_opts = {
          float = { border = vim.g.borders },
        },
      },
    },
    config = function(_, opts)
      require('neviraide-ui.themes.term')
      require('nvterm').setup(opts)
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    version = false,
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
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
    'HiPhish/rainbow-delimiters.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
  },

  {
    'neovim/nvim-lspconfig',
    version = false,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'Bekaboo/dropbar.nvim',
        opts = require('plugins.dropbar.options'),
      },
      {
        'hrsh7th/cmp-nvim-lsp',
        cond = function() return require('neviraide.utils').has('nvim-cmp') end,
      },
      {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        build = ':MasonUpdate',
        config = require('plugins.mason.config'),
      },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'ray-x/lsp_signature.nvim' },
    },
    config = require('plugins.lspconfig.config'),
  },

  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'williamboman/mason.nvim', 'nvimtools/none-ls.nvim' },
    config = require('plugins.lsp.null'),
  },

  {
    'olexsmir/gopher.nvim',
    ft = 'go',
    config = require('plugins.gopher.config'),
  },

  {
    'ggandor/lightspeed.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
  },

  {
    'numToStr/Comment.nvim',
    keys = require('plugins.comment.keys'),
    -- opts = require('plugins.comment.options'),
    config = function(_, opts) require('Comment').setup(opts) end,
  },

  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && ./install.sh',
    ft = { 'markdown' },
    config = require('plugins.markdown-preview.config'),
  },

  {
    'uga-rosa/ccc.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = function()
      return {
        highlighter = {
          auto_enable = true,
          excludes = { 'neo-tree' },
        },
      }
    end,
  },

  {
    'mfussenegger/nvim-dap',
    event = 'BufReadPre',
    dependencies = {
      { 'theHamsta/nvim-dap-virtual-text', config = true },
      { 'rcarriga/nvim-dap-ui', config = true },
      { 'leoluz/nvim-dap-go', config = true },
    },
    config = require('plugins.dap.config'),
  },

  -- FIX: can't git push from neotree(not input for ssh password)
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
    'folke/which-key.nvim',
    keys = require('plugins.which-key.keys'),
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = function() return require('plugins.which-key.options') end,
  },

  {
    'lewis6991/gitsigns.nvim',
    ft = { 'gitcommit', 'diff' },
    init = require('plugins.gitsigns.start'),
    opts = require('plugins.gitsigns.options'),
  },

  {
    'folke/todo-comments.nvim',
    cmd = 'TodoTelescope',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = require('plugins.todo-comments.options'),
  },

  {
    'nvim-neotest/neotest',
    ft = 'go',
    dependencies = { 'nvim-neotest/neotest-go' },
    config = require('plugins.neotest.config'),
  },
}

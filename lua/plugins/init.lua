local util = require('neviraide.utils')

return {
  { 'nvim-lua/plenary.nvim' },

  { 'MunifTanjim/nui.nvim' },

  { 'wakatime/vim-wakatime', event = 'VeryLazy' },

  {
    'RAprogramm/nekifoch',
    dir = '~/GitHub/nvim_plugins/nekifoch.nvim',
    cmd = 'Nekifoch',
    opts = {},
  },

  {
    'nvim-tree/nvim-web-devicons',
    opts = function() return { override = util.icons().global } end,
    config = function(_, opts)
      dofile(vim.g.neviraide_themes_cache .. 'icons')
      require('nvim-web-devicons').setup(opts)
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = util.opt('ui.indent-blankline'),
    config = util.con('ui.indent-blankline'),
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
    event = { 'BufReadPre', 'BufNewFile', 'BufAdd' },
    dependencies = {
      { 'Bekaboo/dropbar.nvim', opts = util.opt('dropbar') },
      {
        'hrsh7th/cmp-nvim-lsp',
        cond = function() return util.has('nvim-cmp') end,
      },
      {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        build = ':MasonUpdate',
        config = util.con('lsp.mason'),
      },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    init_options = {
      userLanguages = {
        eelixir = 'html-eex',
        eruby = 'erb',
        rust = 'html',
      },
    },
    config = util.con('lsp.lspconfig'),
  },

  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'williamboman/mason.nvim', 'nvimtools/none-ls.nvim' },
    config = require('plugins.lsp.null'),
  },

  { 'olexsmir/gopher.nvim', ft = 'go', config = util.con('gopher') },

  { 'ggandor/lightspeed.nvim', event = { 'BufReadPost', 'BufNewFile' } },

  {
    'numToStr/Comment.nvim',
    keys = require('plugins.comment.keys'),
    config = function(_, opts) require('Comment').setup(opts) end,
  },

  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && ./install.sh',
    ft = { 'markdown' },
    config = util.con('markdown-preview'),
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
    config = util.con('dap'),
  },

  -- FIX: can't git push from neotree(not input for ssh password)
  {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    opts = util.opt('neotree'),
  },

  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    opts = util.opt('telescope'),
    config = util.con('telescope'),
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
    opts = util.opt('gitsigns'),
  },

  {
    'folke/todo-comments.nvim',
    cmd = 'TodoTelescope',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = require('plugins.todo-comments.options'),
  },

  {
    'nvim-neotest/neotest',
    ft = 'go, rust',
    dependencies = { 'nvim-neotest/neotest-go', 'rouge8/neotest-rust' },
    config = util.con('neotest'),
  },

  {
    'mrcjkb/rustaceanvim',
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = {
        tools = {
          hover_actions = { replace_builtin_hover = false },
          reload_workspace_from_cargo_toml = true,
        },
        server = {
          settings = {
            ['rust-analyzer'] = {
              cargo = {
                buildScripts = { enable = true },
              },
            },
          },
        },
      }
    end,
  },

  {
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local null_ls = require('null-ls')
      require('crates').setup({
        popup = {
          border = vim.g.borders,
        },
        null_ls = {
          enabled = true,
          name = 'crates.nvim',
        },
        src = {
          cmp = {
            enabled = true,
          },
        },
      })
    end,
  },
}

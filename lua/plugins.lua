return {
  'nvim-lua/plenary.nvim',
  'MunifTanjim/nui.nvim',

  {
    dir = '~/GitHub/nvim_plugins/nekifoch.nvim',
    cmd = 'Nekifoch',
    opts = {
      kitty_conf_path = vim.fn.expand('~/.config/kitty/kitty.conf'),
    },
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
    'rcarriga/nvim-notify',
    opts = function() return require('config.notify') end,
    init = function()
      require('neviraide.utils').on_very_lazy(
        function() vim.notify = require('notify') end
      )
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = function() return require('config.indentblankline') end,
    config = function(_, opts)
      dofile(vim.g.neviraide_themes_cache .. 'blankline')
      require('indent_blankline').setup(opts)
    end,
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
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        dependencies = {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
        opts = { history = true, updateevents = 'TextChanged,TextChangedI' },
      },
      {
        'windwp/nvim-autopairs',
        opts = {
          fast_wrap = {},
          disable_filetype = { 'TelescopePrompt', 'vim' },
        },
        config = function(_, opts)
          require('nvim-autopairs').setup(opts)
          local cmp_autopairs = require('nvim-autopairs.completion.cmp')
          require('cmp').event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
          )
        end,
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'lukas-reineke/cmp-under-comparator',
      'FelipeLema/cmp-async-path',
    },
    opts = function() return require('config.cmp') end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    opts = function() return require('config.treesitter') end,
    config = function(_, opts)
      dofile(vim.g.neviraide_themes_cache .. 'syntax')
      require('nvim-treesitter.configs').setup(opts)
    end,
    dependencies = {
      'HiPhish/nvim-ts-rainbow2',
      'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  },

  {
    'neovim/nvim-lspconfig',
    version = false,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        build = ':MasonUpdate',
        config = function() require('config.lsp.mason') end,
      },
      'williamboman/mason-lspconfig.nvim',
      'ray-x/lsp_signature.nvim',
      {
        'Bekaboo/dropbar.nvim',
        opts = function() return require('config.lsp.dropbar') end,
      },
      {
        'hrsh7th/cmp-nvim-lsp',
        cond = function() return require('neviraide.utils').has('nvim-cmp') end,
      },
    },
    config = function() require('config.lsp') end,
  },

  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'jose-elias-alvarez/null-ls.nvim',
    },
    config = function() require('config.lsp.null') end,
  },

  {
    'olexsmir/gopher.nvim',
    ft = 'go',
    config = function()
      require('gopher').setup({
        commands = {
          go = 'go',
          gomodifytags = 'gomodifytags',
          gotests = 'gotests',
          impl = 'impl',
          iferr = 'iferr',
        },
      })
      require('gopher.dap').setup()
    end,
  },

  {
    'ggandor/lightspeed.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
  },

  {
    'numToStr/Comment.nvim',
    keys = {
      { 'gcc', mode = 'n', desc = 'Comment toggle current line' },
      { 'gc', mode = { 'n', 'o' }, desc = 'Comment toggle linewise' },
      { 'gc', mode = 'x', desc = 'Comment toggle linewise (visual)' },
      { 'gbc', mode = 'n', desc = 'Comment toggle current block' },
      { 'gb', mode = { 'n', 'o' }, desc = 'Comment toggle blockwise' },
      { 'gb', mode = 'x', desc = 'Comment toggle blockwise (visual)' },
    },
    config = function(_, opts) require('Comment').setup(opts) end,
  },

  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && ./install.sh',
    ft = { 'markdown' },
    config = function()
      vim.cmd([[
        function OpenMarkdownPreview (url)
          execute "silent ! firefox-developer-edition --new-window " . a:url
        endfunction
      ]])
      vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
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
    config = function() require('config.dap') end,
  },

  -- FIX: can't git push from neotree(not input for ssh password)
  {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    opts = function() return require('config.neotree') end,
  },

  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    opts = function() return require('config.telescope') end,
    config = function(_, opts)
      local telescope = require('telescope')
      telescope.setup(opts)
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },

  {
    'folke/which-key.nvim',
    keys = { '<leader>', '"', "'", '`', '<c-n>', '<c-s>', 'v' },
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = function() return require('config.whichkey') end,
  },

  {
    'lewis6991/gitsigns.nvim',
    ft = { 'gitcommit', 'diff' },
    init = require('config.gitsigns').init(),
    opts = function() return require('config.gitsigns').opts() end,
  },

  {
    'folke/todo-comments.nvim',
    cmd = 'TodoTelescope',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = function() return require('config.todo') end,
  },

  {
    'wakatime/vim-wakatime',
    event = 'VeryLazy',
  },
}

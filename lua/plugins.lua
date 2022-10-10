require('packer').init({
  auto_reload_compiled = true,
  git = { clone_timeout = 350 },
  display = {
    title = 'Packer',
    done_sym = '✓',
    error_syn = '✗',
    keybindings = { toggle_info = 'o' },
  },
})

return require('packer').startup({
  function(use)
    use('wbthomason/packer.nvim')
    use('nvim-lua/popup.nvim')
    use('nvim-lua/plenary.nvim')
    -- mason
    use('williamboman/mason.nvim')
    use('WhoIsSethDaniel/mason-tool-installer.nvim')
    use('williamboman/mason-lspconfig.nvim')
    -- ui
    use('kyazdani42/nvim-web-devicons')
    use({
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    })
    use('navarasu/onedark.nvim')
    use({
      'yamatsum/nvim-nonicons',
      requires = { 'kyazdani42/nvim-web-devicons' },
    })
    use('lukas-reineke/indent-blankline.nvim')
    use('rcarriga/nvim-notify')
    use('glepnir/dashboard-nvim')
    -- telescope
    use({ 'nvim-telescope/telescope.nvim', tag = '0.1.0' })
    use('nvim-telescope/telescope-ui-select.nvim')
    -- utils
    use('SmiteshP/nvim-navic')
    use('uga-rosa/ccc.nvim')
    -- FIX: troubles with vertical direction terminal windows
    use({
      'anuvyklack/windows.nvim',
      requires = {
        'anuvyklack/middleclass',
        'anuvyklack/animation.nvim',
      },
      config = function()
        vim.o.winwidth = 10
        vim.o.winminwidth = 10
        vim.o.equalalways = false
        require('windows').setup({
          animation = {
            fps = 60,
          },
        })
      end,
    })
    use({
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' },
      tag = 'nightly',
    })
    use('lewis6991/impatient.nvim')
    use('ggandor/lightspeed.nvim')
    use('xiyaowong/link-visitor.nvim')
    use({
      'iamcco/markdown-preview.nvim',
      run = 'cd app && npm install',
      setup = function() vim.g.mkdp_filetypes = { 'markdown' } end,
      ft = { 'markdown' },
    })
    use({
      'danymat/neogen',
      config = function() require('config.neogen') end,
    })
    use({
      'lewis6991/gitsigns.nvim',
      config = function() require('config.gitsigns') end,
    })
    use({
      'windwp/nvim-autopairs',
      config = function() require('config.autopairs') end,
    })
    use({
      'numToStr/Comment.nvim',
      requires = { 'nvim-ts-context-commentstring', 'nvim-treesitter' },
      config = function() require('config.comment') end,
    })
    use({
      'folke/todo-comments.nvim',
      config = function() require('config.todo-comments') end,
    })
    use('folke/which-key.nvim')
    -- treesitter
    use({
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    })
    use('JoosepAlviste/nvim-ts-context-commentstring')
    use({ 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' })
    -- lsp
    use('neovim/nvim-lspconfig')
    use({ 'ray-x/lsp_signature.nvim', after = 'nvim-lspconfig' })
    use({
      'jose-elias-alvarez/null-ls.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
    })
    use('onsails/lspkind-nvim')
    use({
      'glepnir/lspsaga.nvim',
      branch = 'main',
      config = function() require('lsp.saga') end,
    })
    -- TODO: make powerfull debug system
    -- Debugger
    -- use('nvim-neotest/neotest')
    -- use('nvim-neotest/neotest-python')
    -- use({
    --   'mfussenegger/nvim-dap',
    --   requires = {
    --     'mfussenegger/nvim-dap-python',
    --     'theHamsta/nvim-dap-virtual-text',
    --     'rcarriga/nvim-dap-ui',
    --   },
    -- })
    -- completions
    use('hrsh7th/cmp-nvim-lsp')
    use({
      'hrsh7th/nvim-cmp',
      config = function() require('config.cmp') end,
      requires = {
        { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-calc', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        { 'kdheepak/cmp-latex-symbols', after = 'nvim-cmp' },
        { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
        { 'L3MON4D3/LuaSnip', after = 'nvim-cmp' },
      },
    })
    use({ 'saadparwaiz1/cmp_luasnip' })
    use({
      'L3MON4D3/LuaSnip',
      after = 'nvim-cmp',
      config = function() require('config.snippets') end,
    })
    use('rafamadriz/friendly-snippets')
  end,
  config = {
    compile_path = vim.fn.stdpath('config') .. '/lua/packer_compiled.lua',
    display = {
      open_fn = function() return require('packer.util').float({ border = 'rounded' }) end,
    },
    profile = {
      enable = true,
      threshold = 1,
    },
  },
})

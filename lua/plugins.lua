local fn = vim.fn
local execute = vim.api.nvim_command
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute(
    '!git clone https://github.com/wbthomason/packer.nvim ' .. install_path
  )
  vim.cmd('packadd packer.nvim')
end
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
    use('norcalli/nvim-colorizer.lua')
    use('rcarriga/nvim-notify')
    use('glepnir/dashboard-nvim')
    -- telescope
    use({ 'nvim-telescope/telescope.nvim', tag = '0.1.0' })
    use('nvim-telescope/telescope-project.nvim')
    use('nvim-telescope/telescope-file-browser.nvim')
    use('nvim-telescope/telescope-ui-select.nvim')
    -- utils
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
      'ziontee113/color-picker.nvim',
      config = function() require('config.color-picker') end,
    })
    -- TODO: create config with keybindings
    use({
      'lewis6991/gitsigns.nvim',
      event = 'BufRead',
      config = function() require('config.gitsigns') end,
    })
    use({
      'akinsho/toggleterm.nvim',
      tag = 'v2.*',
      config = function() require('config.toggle-term') end,
    })
    use({
      'windwp/nvim-autopairs',
      config = function() require('config.autopairs') end,
    })
    use({
      'numToStr/Comment.nvim',
      config = function() require('config.comment') end,
    })
    use({
      'folke/todo-comments.nvim',
      config = function() require('config.todo-comments') end,
    })
    use({
      'folke/which-key.nvim',
      config = function() require('config.which_key') end,
    })
    -- treesitter
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use('JoosepAlviste/nvim-ts-context-commentstring')
    use({ 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' })
    -- lsp
    use('neovim/nvim-lspconfig')
    use({ 'ray-x/lsp_signature.nvim', after = 'nvim-lspconfig' })
    use({
      'jose-elias-alvarez/null-ls.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
    })
    -- TODO: lspkind icons whith nonicons
    use('onsails/lspkind-nvim')
    use({
      'glepnir/lspsaga.nvim',
      branch = 'main',
      config = function() require('lsp.saga') end,
    })
    -- Debugger
    use({
      'mfussenegger/nvim-dap',
      requires = {
        'mfussenegger/nvim-dap-python',
        'theHamsta/nvim-dap-virtual-text',
        'rcarriga/nvim-dap-ui',
      },
    })
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

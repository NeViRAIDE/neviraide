return {
  {
    'briones-gabriel/darcula-solid.nvim',
    lazy = false,
    dependencies = 'rktjmp/lush.nvim',
    config = function() vim.cmd('colorscheme darcula-solid') end,
  },
  {
    'yamatsum/nvim-nonicons',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = true,
  },
  {
    'folke/which-key.nvim',
    lazy = false,
    config = function() require('config.which-key').setup() end,
  },
  {
    'olexsmir/gopher.nvim',
    event = 'VeryLazy',
  },
  { 'ggandor/lightspeed.nvim', event = 'BufReadPre' },
  'nvim-lua/plenary.nvim',
  'ggandor/lightspeed.nvim',
  'ray-x/lsp_signature.nvim',
  { 'ray-x/web-tools.nvim', event = 'VeryLazy', config = true },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'BufReadPre',
    config = true,
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    config = true,
  },
}

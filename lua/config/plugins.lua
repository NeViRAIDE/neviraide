return {
  -- TODO: colorscheme for not gui
  -- TODO: dynamic change colorscheme
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
    'olexsmir/gopher.nvim',
    event = 'VeryLazy',
  },
  { 'ggandor/lightspeed.nvim', event = 'BufReadPre' },
  'nvim-lua/plenary.nvim',
  'ggandor/lightspeed.nvim',
  'ray-x/lsp_signature.nvim',
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
  'nanotee/sqls.nvim',
}

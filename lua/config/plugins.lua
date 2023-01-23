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
  -- TODO: add picture support
  --
  -- {
  --   'edluffy/hologram.nvim',
  --   event = 'BufReadPre',
  --   config = function()
  --     require('hologram').setup({
  --       auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
  --     })
  --   end,
  -- },
  -- TODO: sql support
  --
  -- 'nanotee/sqls.nvim',
  -- https://github.com/nanotee/sqls.nvim/blob/main/doc/sqls-nvim.txt#L14
}

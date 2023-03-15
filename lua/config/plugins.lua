require('utils.icons')

return {
  {
    'yamatsum/nvim-nonicons',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      if term == 'xterm-kitty' then return require('nvim-nonicons').setup() end
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    config = function()
      require('gitsigns').setup({ preview_config = { border = 'rounded' } })
    end,
  },
  {
    'danymat/neogen',
    event = 'BufReadPre',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function() require('neogen').setup({ snippet_engine = 'luasnip' }) end,
  },
  {
    'uga-rosa/ccc.nvim',
    event = 'BufReadPre',
    config = function()
      require('ccc').setup({
        highlighter = { auto_enable = true, excludes = { 'neo-tree' } },
      })
    end,
  },
  {
    'olexsmir/gopher.nvim',
    event = 'BufReadPre',
    config = function()
      require('gopher').setup()
      require('gopher.dap').setup()
      require('utils.golang')
    end,
  },
  { 'ggandor/lightspeed.nvim', event = 'BufReadPre' },
  {
    'Shatur/neovim-session-manager',
    event = 'VeryLazy',
    config = function()
      require('session_manager').setup({
        sessions_dir = require('plenary.path'):new(
          vim.fn.stdpath('cache'),
          'sessions'
        ),
        autosave_last_session = false,
      })
    end,
  },
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
  'nvim-lua/plenary.nvim',
  'ray-x/lsp_signature.nvim',
  'nanotee/sqls.nvim',
  {
    'simrat39/symbols-outline.nvim',
    lazy = false,
    config = function()
      require('symbols-outline').setup({
        relative_width = false,
        auto_close = false,
        width = 15,
      })
    end,
  },
}

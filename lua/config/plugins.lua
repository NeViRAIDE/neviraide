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
      -- TODO: enable for cmp float windows
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
  -- TODO: learn "NEORG"
  {
    'nvim-neorg/neorg',
    -- lazy = false,
    event = 'VeryLazy',
    build = ':Neorg sync-parsers',
    opts = {
      load = {
        ['core.ui'] = {},
        -- ['core.presenter'] = {},
        ['core.defaults'] = {}, -- Loads default behaviour
        ['core.norg.concealer'] = {}, -- Adds pretty icons to your documents
        ['core.integrations.telescope'] = {},
        ['core.norg.completion'] = {
          config = {
            engine = 'nvim-cmp',
            name = '[Neorg]',
          },
        },
        ['core.norg.dirman'] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = '~/notes',
            },
          },
        },
      },
    },
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-neorg/neorg-telescope' },
    },
  },
}

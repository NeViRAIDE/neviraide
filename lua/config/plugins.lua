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
    'olexsmir/gopher.nvim',
    event = 'VeryLazy',
  },
  { 'ggandor/lightspeed.nvim', event = 'BufReadPre' },
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
}

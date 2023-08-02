return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    opts = function()
      return {
        highlight = {
          enable = true,
          use_languagetree = true,
        },
        indent = { enable = true },
        rainbow = {
          enable = true,
          disable = { 'jsx', 'cpp' },
          query = 'rainbow-parens',
          strategy = require('ts-rainbow').strategy.global,
        },
        autotag = { enable = true },
        incremental_selection = { enable = true },
        textobjects = {
          enable = true,
          lsp_interop = { enable = true },
          move = { enable = true, set_jumps = true },
          select = { enable = true },
          swap = { enable = true },
        },
      }
    end,
    config = function(_, opts) require('nvim-treesitter.configs').setup(opts) end,
    dependencies = {
      'HiPhish/nvim-ts-rainbow2',
      'windwp/nvim-ts-autotag',
    },
  },
}

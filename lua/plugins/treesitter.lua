return {
  'nvim-treesitter/nvim-treesitter',
  init = function()
    require("utils").lazy_load "nvim-treesitter"
  end,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'go', 'lua', },
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
      autotag = {
        enable = true,
      }
    })
  end,
  dependencies = {
    "HiPhish/nvim-ts-rainbow2",
    'windwp/nvim-ts-autotag'
  }
}

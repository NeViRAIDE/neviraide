-- TODO: add session manager

return {
  "nvim-lua/plenary.nvim",
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    'ggandor/lightspeed.nvim',
    init = function()
      require("utils").lazy_load "lightspeed.nvim"
    end,
  }
}

-- TODO: add session manager

return {
   "nvim-lua/plenary.nvim" ,
  { 'ggandor/lightspeed.nvim', event = "VeryLazy" },

  -- Editor
  require("config.editor.neo-tree"),
  require("config.editor.telescope"),
  require("config.editor.todos"),

  -- UI
   "nvim-tree/nvim-web-devicons" ,
   "MunifTanjim/nui.nvim" ,
  require("config.ui.lualine"),
  require("config.ui.gitsigns"),
  require("config.ui.indent"),
  require("config.ui.noice"),
  require("config.ui.notify"),
  require("config.ui.dressing"),
  require("config.ui.which-key"),
  require("config.ui.colorscheme"),

  -- LSP
  require("config.lsp.lspconfig"),
  'ray-x/lsp_signature.nvim',

  require("config.ccc"),
  require("config.cmp"),
  require("config.comment"),
  require("config.go"),
  require("config.toggleterm"),
  require("config.treesitter"),
}

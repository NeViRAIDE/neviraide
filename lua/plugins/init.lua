-- TODO: add session manager

return {
  "nvim-lua/plenary.nvim",
  { 'ggandor/lightspeed.nvim', event = "VeryLazy" },

  -- Editor
  require("plugins.config.editor.neo-tree"),
  require("plugins.config.editor.telescope"),
  require("plugins.config.editor.todos"),

  -- UI
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",
  require("plugins.config.ui.lualine"),
  require("plugins.config.ui.gitsigns"),
  require("plugins.config.ui.indent"),
  require("plugins.config.ui.noice"),
  require("plugins.config.ui.notify"),
  require("plugins.config.ui.which-key"),
  require("plugins.config.ui.colorscheme"),

  -- LSP
  require("plugins.config.lsp"),
  'ray-x/lsp_signature.nvim',

  require("plugins.config.ccc"),
  require("plugins.config.cmp"),
  require("plugins.config.comment"),
  --require("config.go"),
  require("plugins.config.toggleterm"),
  require("plugins.config.treesitter"),
}

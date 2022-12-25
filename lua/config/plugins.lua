return {
  { "briones-gabriel/darcula-solid.nvim",
    dependencies = "rktjmp/lush.nvim",
    config = function()
      vim.cmd 'colorscheme darcula-solid'
    end
  },
  { "folke/which-key.nvim",
    lazy = false,
    config = function()
      require('config.which-key').setup()
    end
  },
  'nvim-tree/nvim-web-devicons',
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "olexsmir/gopher.nvim",
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()
    end
  },
  "ggandor/lightspeed.nvim",
  "xiyaowong/link-visitor.nvim",
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && ./install.sh",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  "ray-x/lsp_signature.nvim",
  "onsails/lspkind-nvim",
  {
    "olexsmir/gopher.nvim",
    event = "VeryLazy"
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "BufEnter",
    config = true
  },
  { "ggandor/lightspeed.nvim",
    event = "BufReadPre"
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = true,
  },
  { "mfussenegger/nvim-dap", dependencies = { "theHamsta/nvim-dap-virtual-text", "rcarriga/nvim-dap-ui" } },
  {
    "mfussenegger/nvim-dap",
    dependencies = { "theHamsta/nvim-dap-virtual-text", "rcarriga/nvim-dap-ui" }
  },
  "ray-x/lsp_signature.nvim",
  "onsails/lspkind-nvim",
}

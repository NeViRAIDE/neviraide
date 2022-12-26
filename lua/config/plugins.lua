return {
  { "briones-gabriel/darcula-solid.nvim",
    lazy = false,
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
  "ggandor/lightspeed.nvim",
  {
    "olexsmir/gopher.nvim",
    event = "VeryLazy"
  },
  { "ggandor/lightspeed.nvim",
    event = "BufReadPre"
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = true,
  },
  "ray-x/lsp_signature.nvim",
  "onsails/lspkind-nvim",
}

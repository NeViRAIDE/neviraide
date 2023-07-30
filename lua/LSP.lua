return {

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      'ray-x/lsp_signature.nvim',
      {
        -- FIX: not working on click
        "SmiteshP/nvim-navic",
        opts = {
          separator = ' ▶ ',
          highlight = true,
          depth_limit = 7,
          depth_limit_indicator = "...",
          click = true
        }
      },
      {
        "hrsh7th/cmp-nvim-lsp",
        cond = function() return require("core.utils").has("nvim-cmp") end,
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lsp_config = require("mason-lspconfig")
      mason_lsp_config.setup({
        ensure_installed = {
          "gopls",
          "lua_ls",
        },
        automatic_installation = true,
      })

      mason_lsp_config.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = require("core.lsp.on_attach"),
            capabilities = require("core.lsp.capabilities"),
          })
        end,
        ["lua_ls"] = function(_)
          lspconfig.lua_ls.setup(require('core.lsp.servers.lua'))
        end,
        ["gopls"] = function(_)
          lspconfig.gopls.setup(require('core.lsp.servers.go'))
        end,
      })

      require('core.lsp.diagnostic').setup()
    end,
  },
}

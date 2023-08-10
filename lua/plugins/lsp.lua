return {
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    build = ':MasonUpdate',
    opts = {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'ray-x/lsp_signature.nvim',
      {
        -- FIX: not working on click
        'SmiteshP/nvim-navic',
        opts = {
          separator = ' ▶ ',
          highlight = true,
          depth_limit = 7,
          depth_limit_indicator = '...',
          click = true,
        },
      },
      {
        'hrsh7th/cmp-nvim-lsp',
        cond = function() return require('core.utils').has('nvim-cmp') end,
      },
    },
    config = function()
      local lspconfig = require('lspconfig')
      local mason_lsp_config = require('mason-lspconfig')
      mason_lsp_config.setup({
        ensure_installed = {
          'gopls',
          'lua_ls',
        },
        automatic_installation = true,
      })

      mason_lsp_config.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = require('core.lsp.on_attach'),
            capabilities = require('core.lsp.capabilities'),
          })
        end,
        ['lua_ls'] = function(_)
          lspconfig.lua_ls.setup(require('core.lsp.servers.lua'))
        end,
        ['gopls'] = function(_)
          lspconfig.gopls.setup(require('core.lsp.servers.go'))
        end,
        ['volar'] = function(_)
          lspconfig.volar.setup(require('core.lsp.servers.vue'))
        end,
      })

      require('core.lsp.diagnostic').setup()
    end,
  },

  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'jose-elias-alvarez/null-ls.nvim',
    },
    config = function()
      local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
      if not null_ls_status_ok then return end

      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      local hover = null_ls.builtins.hover
      local code_action = null_ls.builtins.code_actions

      return {
        root_dir = require('null-ls.utils').root_pattern(
          '.null-ls-root',
          '.neoconf.json',
          'Makefile',
          '.git'
        ),
        null_ls.setup({
          sources = {
            code_action.gitsigns,
            hover.dictionary,
            formatting.fish_indent,
            diagnostics.fish,
            formatting.stylua.with({
              extra_args = {
                '--quote-style',
                'AutoPreferSingle',
                '--indent-type',
                'Spaces',
                '--indent-width',
                '2',
                '--column-width',
                '80',
                '--collapse-simple-statement',
                'Always',
              },
            }),
            formatting.shfmt,
            formatting.prettier.with({
              extra_args = {
                '--jsx-single-quote',
                '--vue-indent-script-and-style',
                '--no-semi',
                '--single-quote',
                '--single-attribute-per-line',
                '--trailing-comma',
                'none',
              },
            }),
          },
        }),
      }
    end,
  },
}

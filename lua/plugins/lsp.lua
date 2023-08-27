local icon = require('neviraide-ui.icons.utils').icon

return {
  {
    'neovim/nvim-lspconfig',
    version = false,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'williamboman/mason.nvim',
        version = '*',
        cmd = 'Mason',
        build = ':MasonUpdate',
        opts = {
          ui = {
            border = NEVIRAIDE().border,
            width = 0.6,
            height = 0.8,
            icons = {
              package_installed = icon('check') .. ' ',
              package_pending = icon('sync') .. ' ',
              package_uninstalled = icon('x') .. ' ',
            },
          },
        },
        config = function(_, opts)
          dofile(vim.g.neviraide_themes_cache .. 'mason')
          require('mason').setup(opts)
        end,
      },
      { 'williamboman/mason-lspconfig.nvim', version = '*' },
      { 'ray-x/lsp_signature.nvim', version = '*' },
      {
        'Bekaboo/dropbar.nvim',
        version = '*',
        opts = {
          sources = {
            path = {
              modified = function(sym)
                return sym:merge({
                  name = sym.name .. '  ',
                  icon = icon('pencil') .. '  ',
                  name_hl = 'DiagnosticError',
                  icon_hl = 'DiagnosticError',
                })
              end,
            },
          },
          icons = {
            kinds = {
              use_devicons = true,
              symbol = require('neviraide-ui.icons.lspkind'),
            },
            ui = {
              bar = {
                separator = ' ' .. icon('chevron-right') .. ' ',
                extends = '…',
              },
            },
          },
        },
      },
      {
        'hrsh7th/cmp-nvim-lsp',
        version = '*',
        cond = function() return require('neviraide.utils').has('nvim-cmp') end,
      },
    },
    config = function()
      dofile(vim.g.neviraide_themes_cache .. 'lsp')
      require('lspconfig.ui.windows').default_options.border =
        NEVIRAIDE().border
      require('neviraide.lsp.diagnostic').setup()

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
            on_attach = require('neviraide.lsp.on_attach'),
            capabilities = require('neviraide.lsp.capabilities'),
          })
        end,
        ['lua_ls'] = function(_)
          lspconfig.lua_ls.setup(require('neviraide.lsp.servers.lua'))
        end,
        ['gopls'] = function(_)
          lspconfig.gopls.setup(require('neviraide.lsp.servers.go'))
        end,
        ['volar'] = function(_)
          lspconfig.volar.setup(require('neviraide.lsp.servers.vue'))
        end,
      })
    end,
  },

  {
    'jay-babu/mason-null-ls.nvim',
    version = '*',
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
      local completion = null_ls.builtins.completion

      return {
        root_dir = require('null-ls.utils').root_pattern(
          '.null-ls-root',
          '.neoconf.json',
          'Makefile',
          '.git'
        ),
        null_ls.setup({
          sources = {
            completion.luasnip,
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

return {
  'neovim/nvim-lspconfig',
  version = false,
  event = { 'BufReadPre', 'BufNewFile', 'BufAdd' },
  dependencies = {
    {
      'Bekaboo/dropbar.nvim',
      opts = function()
        local icon = require('stigmata.utils').icon

        return {
          menu = {
            win_configs = {
              border = vim.g.b,
            },
          },
          sources = {
            path = {
              modified = function(sym)
                return sym:merge({
                  name = sym.name .. icon('', 'dot-fill', 1, 1),
                  icon = icon('', 'pencil', 0, 2),
                  name_hl = 'DiagnosticError',
                  icon_hl = 'DiagnosticError',
                })
              end,
            },
          },
          icons = {
            kinds = {
              use_devicons = true,
              symbol = require('neviraide.utils').icons().lspkind,
            },
            ui = {
              bar = {
                separator = icon('', 'chevron-right', 1, 1),
                extends = '…',
              },
            },
          },
        }
      end,
    },
    {
      'hrsh7th/cmp-nvim-lsp',
      cond = function() return require('neviraide.utils').has('nvim-cmp') end,
    },
    {
      'williamboman/mason.nvim',
      cmd = 'Mason',
      build = ':MasonUpdate',
      opts = {
        -- TODO: add auto insert langs from NEVIRAIDE
        ensure_installed = {
          -- 'stylua',
          -- 'shfmt',
          -- "flake8",
        },
      },
      config = function(_, opts)
        local icon = require('stigmata.utils').icon

        dofile(vim.g.ntc .. 'mason')

        require('mason').setup({
          ui = {
            border = vim.g.b,
            width = 0.6,
            height = 0.8,
            icons = {
              package_installed = icon('', 'check', 0, 1),
              package_pending = icon('', 'sync', 0, 1),
              package_uninstalled = icon('', 'x', 0, 1),
            },
          },
        })

        local mr = require('mason-registry')
        mr:on('package:install:success', function()
          vim.defer_fn(function()
            -- trigger FileType event to possibly load this newly installed LSP server
            require('lazy.core.handler.event').trigger({
              event = 'FileType',
              buf = vim.api.nvim_get_current_buf(),
            })
          end, 100)
        end)

        local function ensure_installed()
          for _, tool in ipairs(opts.ensure_installed) do
            local p = mr.get_package(tool)
            if not p:is_installed() then p:install() end
          end
        end

        if mr.refresh then
          mr.refresh(ensure_installed)
        else
          ensure_installed()
        end
      end,
    },
    { 'williamboman/mason-lspconfig.nvim' },
    -- TODO: LSP_SIGNATURE realize myself
    -- {
    --   'ray-x/lsp_signature.nvim',
    --   event = 'VeryLazy',
    --   opts = {
    --     bind = true,
    --     hint_prefix = '🐼 ',
    --     hint_enable = false,
    --     floating_window = true,
    --     handler_opts = { border = vim.g.b },
    --   },
    --   config = function(_, opts) require('lsp_signature').setup(opts) end,
    -- },
  },
  config = function()
    dofile(vim.g.ntc .. 'lsp')

    ---server returns lsp servers configuration.
    ---@param filetype string
    ---@return function
    local function server(filetype)
      return require('neviraide.lsp.servers.' .. filetype)
    end

    return function()
      local lspconfig = require('lspconfig')
      local mason_lsp_config = require('mason-lspconfig')

      require('neviraide.lsp.autocommands')
      -- LspInfo borders
      require('lspconfig.ui.windows').default_options.border = vim.g.b

      vim.lsp.handlers['textDocument/signatureHelp'] =
        vim.lsp.with(vim.lsp.handlers.signature_help, {
          -- Use a sharp border with `FloatBorder` highlights
          border = vim.g.b,
        })

      vim.lsp.handlers['textDocument/hover'] =
        vim.lsp.with(vim.lsp.handlers.hover, {
          border = vim.g.b,
        })

      mason_lsp_config.setup({
        ensure_installed = {
          'lua_ls',
        },
        automatic_installation = true,
      })

      mason_lsp_config.setup_handlers({
        function(server_name)
          if server_name ~= 'rust_analyzer' then
            lspconfig[server_name].setup({
              capabilities = require('neviraide.lsp.capabilities'),
              single_file_support = true,
            })
          end
        end,
        ['lua_ls'] = function(_) lspconfig.lua_ls.setup(server('lua')) end,
        ['tsserver'] = function(_) lspconfig.tsserver.setup(server('ts_js')) end,
      })
    end
  end,
}

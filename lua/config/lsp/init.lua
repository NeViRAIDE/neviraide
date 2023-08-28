dofile(vim.g.neviraide_themes_cache .. 'lsp')

require('lspconfig.ui.windows').default_options.border = NEVIRAIDE().border
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

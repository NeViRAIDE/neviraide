require('lspconfig').sqls.setup({
  on_attach = require('config.plugins.lsp.on_attach').build(),
  capabilities = require('config.plugins.lsp.capabilities').build(),
  single_file_support = true,
  settings = {
    sqls = {
      connections = {
        {
          driver = 'postgresql',
          dataSourceName = 'postgres://<user>:<password>@localhost/<database_name>?sslmode=disable',
        },
      },
    },
  },
})

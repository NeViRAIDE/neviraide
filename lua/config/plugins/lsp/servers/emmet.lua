require('lspconfig').emmet_ls.setup({
  on_attach = require('config.plugins.lsp.on_attach').build(),
  capabilities = require('config.plugins.lsp.capabilities').build(),
  single_file_support = true,
  filetypes = {
    'html',
    'typescriptreact',
    'javascriptreact',
    'css',
    'sass',
    'scss',
    'less',
    'eruby',
    'vue',
  },
})

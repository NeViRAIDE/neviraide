require('lspconfig').html.setup({
  on_attach = require('config.plugins.lsp.on_attach').build(),
  capabilities = require('config.plugins.lsp.capabilities').build(),
  single_file_support = true,
  filetypes = { 'html', 'template', 'smarty' },
  init_options = {
    configurationSection = { 'html', 'css', 'javascript' },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    provideFormatter = false,
  },
  settings = {
    html = {
      format = {
        templating = true,
      },
    },
  },
})

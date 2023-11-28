return {
  capabilities = require('neviraide.lsp.capabilities'),
  flags = { debounce_text_changes = 150 },
  single_file_support = true,
  init_options = {
    configurationSection = { 'html', 'css', 'javascript' },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    provideFormatter = true,
  },
}

return {
  on_attach = require('core.lsp.on_attach'),
  capabilities = require('core.lsp.capabilities'),
  flags = { debounce_text_changes = 150 },
  single_file_support = true,
  filetypes = {
    'typescript',
    'javascript',
    'javascriptreact',
    'typescriptreact',
    'vue',
    'json',
  },
  settings = {
    volar = {
      codeLens = {
        references = true,
        pugTools = true,
        scriptSetupTools = true,
      },
    },
    typescript = {
      preferences = {
        importModuleSpecifier = 'non-relative',
      },
    },
  },
}

return {
  capabilities = require('neviraide.lsp.capabilities'),
  flags = { debounce_text_changes = 150 },
  single_file_support = true,
  settings = {
    ['js/ts'] = {
      implicitProjectConfig = { experimentalDecorators = true },
    },
    typescript = {
      format = {
        insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = true,
      },
      implementationsCodeLens = { enabled = true },
    },
  },
}

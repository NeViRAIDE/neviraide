require 'lspconfig'.gopls.setup {
  on_attach = require('config.plugins.lsp.on_attach').build(),
  flags = { debounce_text_changes = 150 },
  single_file_support = true,
}

autocmd("NEVIRAIDE_GO",
  'FileType',
  {
    pattern = 'go',
    desc = 'Add golang features',
    callback = function() require('config.which-key').attach_golang(0) end,
  }
)

local lspconfig = require('lspconfig')

lspconfig.pyright.setup({
  on_attach = require('lsp.on_attach').build(),
  capabilities = require('lsp.capabilities').build(),
  root_dir = function(fname) return lspconfig.util.find_git_ancestor(fname) end,
  single_file_support = true,
  flags = { debounce_text_changes = 150 },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = 'workspace',
        useLibraryCodeForTypes = true,
      },
    },
  },
})

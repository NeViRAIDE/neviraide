-- TODO: inlay hints for golang (full cofigure gopls)
require("lspconfig").gopls.setup({
  on_attach = require("lsp.on_attach"),
  capabilities = require("lsp.capabilities"),
  flags = { debounce_text_changes = 150 },
  single_file_support = true,
  settings = {
    gopls = {
      -- allExperiments = true,
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
      usePlaceholders = false,
      codelenses = {
        references = true,
        genrate = true,
        gc_details = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}) -- true: apply go.nvim non-default gopls setup, if it is a list, will merge with gopls setup e.g.

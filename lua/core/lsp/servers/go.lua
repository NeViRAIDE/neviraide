return {
  on_attach = require('core.lsp.on_attach'),
  capabilities = require('core.lsp.capabilities'),
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
      semanticTokens = true,
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
}

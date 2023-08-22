return {
  on_attach = require('neviraide.lsp.on_attach'),
  capabilities = require('neviraide.lsp.capabilities'),
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

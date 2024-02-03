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
        insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = true,
        insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = true,
        insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = true,
        insertSpaceAfterTypeAssertion = true,
        insertSpaceBeforeFunctionParenthesis = true,
        insertSpaceAfterConstructor = true,
        semicolons = 'remove',
      },
      implementationsCodeLens = {
        enabled = true,
        showOnInterfaceMethods = true,
      },
      referencesCodeLens = { enabled = true, showOnAllFunctions = true },
      inlayHints = {
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        parameterNames = { enabled = 'all' },
        parameterTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        variableTypes = { enabled = true },
      },
      preferences = { quoteStyle = 'single' },
      suggest = { completeFunctionCalls = true },
      updateImportsOnFileMove = { enabled = 'always' },
      workspaceSymbols = { scope = 'currentProject' },

      -- INFO: uncomment for debug
      -- enableTracing = true,
      -- experimental = { enableProjectDiagnostics = true },
      -- log = 'verbose',
    },
  },
}

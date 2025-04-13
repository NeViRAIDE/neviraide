return {
  settings = {
    vtsls = {
      -- → vtsls.autoUseWorkspaceTsdk                                                     default: false
      -- → vtsls.enableMoveToFileCodeAction                                               default: false
      -- → vtsls.experimental.completion.enableServerSideFuzzyMatch                       default: false
      autoUseWorkspaceTsdk = true,
      experimental = {
        -- completion = {
          -- enableServerSideFuzzyMatch = true,
          -- enableProjectDiagnostics = true,
        -- },
      },
    },
    -- → typescript.implementationsCodeLens.enabled                                     default: false
    -- → typescript.implementationsCodeLens.showOnInterfaceMethods                      default: false
    -- → typescript.locale                                                              default: "auto"
    -- → typescript.npm
    -- → typescript.preferGoToSourceDefinition                                          default: false
    -- → typescript.referencesCodeLens.enabled                                          default: false
    -- → typescript.referencesCodeLens.showOnAllFunctions                               default: false
    -- → typescript.reportStyleChecksAsWarnings                                         default: true
    -- → typescript.suggestionActions.enabled                                           default: true
    -- → typescript.tsdk
    -- → typescript.tsserver.enableTracing                                              default: false
    -- → typescript.tsserver.experimental.enableProjectDiagnostics                      default: false
    -- → typescript.tsserver.log                                                        default: "off"
    -- → typescript.tsserver.maxTsServerMemory                                          default: 3072
    -- → typescript.tsserver.nodePath
    -- → typescript.tsserver.pluginPaths                                                default: []
    -- → typescript.tsserver.useSeparateSyntaxServer                                    default: true
    -- → typescript.tsserver.useSyntaxServer                                            default: "auto"
    -- → typescript.tsserver.watchOptions (alt. 1)
    -- → typescript.tsserver.watchOptions (alt. 2)
    -- → typescript.tsserver.web.projectWideIntellisense.enabled                        default: true
    -- → typescript.tsserver.web.projectWideIntellisense.suppressSemanticErrors         default: false
    -- → typescript.tsserver.web.typeAcquisition.enabled                                default: true
    -- → typescript.updateImportsOnFileMove.enabled                                     default: "prompt"
    -- → typescript.validate.enable                                                     default: true
    -- → typescript.workspaceSymbols.excludeLibrarySymbols                              default: true
    -- → typescript.workspaceSymbols.scope                                              default: "allOpenProjects"
    typescript = {
      format = {
        semicolons = 'remove',
        insertSpaceBeforeFunctionParenthesis = false,
        placeOpenBraceOnNewLineForFunctions = false,
        insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
        insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = true,
        insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = true,
        trimTrailingWhitespace = true,
        convertTabsToSpaces = true,
        tabSize = 2,
        indentSize = 2,
        -- insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = true -- default: false
        -- insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = true -- default: false
        -- insertSpaceAfterSemicolonInForStatements                   = true -- default: true
        -- insertSpaceAfterTypeAssertion                              = true -- default: false
        -- insertSpaceBeforeAndAfterBinaryOperators                   = true -- default: true
        -- insertSpaceBeforeFunctionParenthesis                       = true -- default: false
        -- placeOpenBraceOnNewLineForControlBlocks                    = false -- default: false
        -- placeOpenBraceOnNewLineForFunctions                        = false -- default: false
      },
      -- → typescript.suggest.autoImports                                                 default: true
      -- → typescript.suggest.classMemberSnippets.enabled                                 default: true
      -- → typescript.suggest.completeFunctionCalls                                       default: false
      -- → typescript.suggest.completeJSDocs                                              default: true
      -- → typescript.suggest.enabled                                                     default: true
      -- → typescript.suggest.includeAutomaticOptionalChainCompletions                    default: true
      -- → typescript.suggest.includeCompletionsForImportStatements                       default: true
      -- → typescript.suggest.jsdoc.generateReturns                                       default: true
      -- → typescript.suggest.objectLiteralMethodSnippets.enabled                         default: true
      -- → typescript.suggest.paths                                                       default: true
      preferences = {
        importModuleSpecifier = 'shortest',
        quoteStyle = 'single',
        includePackageJsonAutoImports = 'on',
        organizeImports = true,
        renameMatchingJsxTags = true,
        useAliasesForRenames = true,
        -- → typescript.preferences.autoImportFileExcludePatterns
        -- → typescript.preferences.autoImportSpecifierExcludeRegexes
        -- → typescript.preferences.importModuleSpecifierEnding                             default: "auto"
        -- → typescript.preferences.includePackageJsonAutoImports                           default: "auto"
        -- → typescript.preferences.jsxAttributeCompletionStyle                             default: "auto"
        -- → typescript.preferences.preferTypeOnlyAutoImports                               default: false
        -- → typescript.preferences.renameShorthandProperties                               default: true
      },
      suggest = {
        completeFunctionCalls = false,
        includeAutomaticOptionalChainCompletions = true,
      },
      -- → typescript.inlayHints.enumMemberValues.enabled                                 default: false
      -- → typescript.inlayHints.functionLikeReturnTypes.enabled                          default: false
      -- → typescript.inlayHints.parameterNames.enabled                                   default: "none"
      -- → typescript.inlayHints.parameterNames.suppressWhenArgumentMatchesName           default: true
      -- → typescript.inlayHints.parameterTypes.enabled                                   default: false
      -- → typescript.inlayHints.propertyDeclarationTypes.enabled                         default: false
      -- → typescript.inlayHints.variableTypes.enabled                                    default: false
      -- → typescript.inlayHints.variableTypes.suppressWhenTypeMatchesName                default: true
    },
    javascript = {
      format = {
        semicolons = 'remove',
        quoteStyle = 'single',
        trimTrailingWhitespace = true,
        convertTabsToSpaces = true,
        tabSize = 2,
        indentSize = 2,
      },
      preferences = {
        importModuleSpecifier = 'shortest',
        quoteStyle = 'single',
      },
    },
  },
}

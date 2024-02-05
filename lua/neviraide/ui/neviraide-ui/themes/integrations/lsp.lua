local colors =
  require('neviraide.ui.neviraide-ui.themes').get_theme_tb('base_30')
local theme =
  require('neviraide.ui.neviraide-ui.themes').get_theme_tb('base_16')

return {
  -- LSP References
  LspReferenceText = { bg = theme.base01, bold = true },
  LspReferenceRead = { bg = theme.base01, bold = true },
  LspReferenceWrite = { bg = theme.base01, bold = true, underline = true },

  -- Lsp Diagnostics
  DiagnosticHint = { fg = colors.purple },
  DiagnosticError = { fg = colors.red },
  DiagnosticWarn = { fg = colors.yellow },
  DiagnosticInfo = { fg = colors.green },

  DiagnosticFloatingHint = { fg = colors.purple },
  DiagnosticFloatingError = { fg = colors.red },
  DiagnosticFloatingWarn = { fg = colors.yellow },
  DiagnosticFloatingInfo = { fg = colors.green },

  LspSignatureActiveParameter = {
    fg = colors.green,
    italic = true,
    bold = true,
  },

  LspCodeLens = { fg = 'Grey' },
  LspCodeLensSeparator = { link = 'Boolean' },

  LspInlayHint = { fg = theme.base03, italic = true },
}

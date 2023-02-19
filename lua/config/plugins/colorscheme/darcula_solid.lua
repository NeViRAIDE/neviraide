vim.cmd('colorscheme darcula-solid')

hi('VertSplit', { bg = color.none, fg = color.blue })
hi('NormalFloat', { bg = color.none })
hi('TelescopeBorder', { bg = color.none, fg = color.blue })
hi('TelescopePromptPrefix', { bg = color.none, fg = color.yellow })
hi('TelescopeTitle', { bg = color.none, fg = color.blue, bold = true })
hi('TelescopeSelectionCaret', { bg = color.none, fg = color.lightGreen })
hi('Directory', { fg = color.directoryYellow })
hi('DashboardHeader', { fg = color.green })
hi('DashboardCenter', { fg = color.fg, bold = true })
hi('DashboardFooter', { fg = color.visual, italic = true })
hi('DiagnosticError', { fg = color.red })
hi('DiagnosticWarn', { fg = color.warn })
hi('DiagnosticInfo', { fg = color.blue })
hi('DiagnosticHint', { fg = color.violet })
hi(
  'LspSignatureActiveParameterHint',
  { fg = color.grey, italic = true, bg = color.none }
)
hi(
  'LspSignatureActiveParameter',
  { fg = color.lightGreen, italic = true, bg = color.none }
)
hi('AlphaFortune', { fg = color.green, italic = true, bg = color.none })
hi('DiffChange', { fg = color.blue })
hi('NeoTreeGitModified', { fg = color.blue })
hi('NeoTreeGitDeleted', { fg = color.red })
hi('NeoTreeGitAdded', { fg = color.green })
hi('GitSignsCurrentLineBlame', { fg = color.cyan, italic = true })
hi('LspSagaWinbarSep', { fg = color.red })
hi('Function', { italic = true, fg = '#ffc66b' })
hi('LspCodeLens', { fg = color.grey })
hi('LspCodeLensSeparator', { link = 'Boolean' })
hi('SessionManagerText', { fg = color.violet })
hi('SessionManagerBorder', { fg = color.indigo })
-- cmp
hi(
  'CmpItemAbbrDeprecated',
  { bg = color.none, strikethrough = true, fg = '#808080' }
)
-- hi('CmpItemAbbrMatch', { bg = color.none, fg = '#569CD6' })
hi('CmpItemKindVariable', { bg = color.none, fg = '#9CDCFE' })
hi('CmpItemKindSnippetDefault', { bg = color.none, fg = color.green })
hi('CmpItemKindText', { bg = color.none, fg = '#8fa867' })
hi('CmpItemKindFunction', { bg = color.none, fg = '#ffc66b' })
hi('CmpItemKindMethod', { bg = color.none, fg = '#ffc66b' })
hi('CmpItemKindKeyword', { bg = color.none, fg = '#cd7832' })
hi('CmpItemKindProperty', { bg = color.none, fg = '#a781bb' })
hi('CmpItemKindUnit', { bg = color.none, fg = '#a781bb' })

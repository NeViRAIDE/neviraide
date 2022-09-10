local onedark = require('onedark')

local custom_highlights = {
  TSException = { fg = color.magenta, fmt = 'italic' },
  TSKeywordFunction = { fg = color.magenta, fmt = 'italic,bold' },
  TSInclude = { fg = color.magenta, fmt = 'italic,bold' },
  TSComment = { fmt = color.none },
  CursorLineNr = { fmt = 'bold' },
  Comment = { fmt = color.none },
  StatusLine = { bg = color.none },
  Visual = { bg = color.visual, fmt = 'bold' },
  NormalFloat = { bg = color.none },
  FloatBorder = { fg = color.grey, bg = color.none },
  Folded = { fg = color.indigo, bg = color.none },
  LspSignatureActiveParameter = { fg = '#535965', fmt = 'italic,bold' },
  Diagnostic = { fg = color.darkYellow, fmt = 'italic,bold' },
  rainbowcol1 = { fg = color.blue },
  rainbowcol3 = { fg = color.red },
}

onedark.setup({
  style = 'darker',
  highlights = custom_highlights,
  diagnostics = {
    background = false,
  },
  code_style = {
    strings = 'italic',
    keywords = 'italic,bold',
  },
})

onedark.load()

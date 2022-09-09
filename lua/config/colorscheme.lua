local onedark = require('onedark')

local custom_highlights = {
  TSException = { fg = color.magenta, fmt = 'italic' },
  TSKeywordFunction = { fg = color.magenta, fmt = 'italic,bold' },
  TSInclude = { fg = color.magenta, fmt = 'italic,bold' },
  CursorLineNr = { fmt = 'bold' },
  -- CursorLine = { bg = color.none },
  NormalFloat = { bg = color.none },
  FloatBorder = { fg = color.grey, bg = color.none },
  Diagnostic = { fg = color.darkYellow, fmt = 'italic,bold' },
  Folded = { fg = color.indigo, bg = color.none },
  TSComment = { fmt = color.none },
  Comment = { fmt = color.none },
  StatusLine = { bg = color.none },
  Visual = { bg = color.visual, fmt = 'bold' },
  LspSignatureActiveParameter = { fg = color.lightGreen, fmt = 'bold' },
  rainbowcol1 = { fg = '#4fa6ed' },
  rainbowcol3 = { fg = '#ec5f67' },
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

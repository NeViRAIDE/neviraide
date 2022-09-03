local onedark = require('onedark')
local color = require('settings.colors')

onedark.setup({
  style = 'darker',
  highlights = {
    TSException = { fg = color.magenta, fmt = 'italic' },
    TSKeywordFunction = { fg = color.magenta, fmt = 'italic,bold' },
    TSInclude = { fg = color.magenta, fmt = 'italic,bold' },
    CursorLineNr = { fmt = 'bold' },
    CursorLine = { bg = color.none },
    NormalFloat = { bg = color.none },
    FloatBorder = { fg = 'Gray', bg = color.none },
    Diagnostic = { fg = 'DarkYellow', fmt = 'italic,bold' },
    Folded = { fg = color.indigo, bg = color.none },
    TSComment = { fmt = color.none },
    Comment = { fmt = color.none },
    StatusLine = { bg = color.none },
    LspSignatureActiveParameter = { fg = 'LightGreen', fmt = 'bold' },
  },
  diagnostics = {
    background = false,
  },
  code_style = {
    strings = 'italic',
    keywords = 'italic,bold',
  },
})

onedark.load()

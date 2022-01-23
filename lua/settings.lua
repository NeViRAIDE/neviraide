local utils = require("utils")
local indent = 4
local cmd = vim.cmd

vim.opt.path = "$PWD/**"
vim.opt.cmdheight = 2
vim.opt.showmode = false
vim.opt.conceallevel = 0
vim.opt.listchars = "space:∙"
vim.opt.virtualedit = "block"
vim.opt.ruler = true

utils.opt("o", "foldmethod", "indent")
cmd([[set fillchars=fold:\ ]])
cmd([[
set foldtext=CustomFoldText()
function! CustomFoldText()
# 'fs' minus 1 na prev string
  let fs = v:foldstart
  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
      let line = getline(v:foldstart)
  else
      let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif
  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let expansionString = repeat(" ", w - strwidth(foldSizeStr.line." "))
  return "▼" . line . "..." . expansionString . foldSizeStr
endfunction
]])

vim.opt.laststatus = 2
vim.opt.softtabstop = 4

vim.opt.undofile = false

cmd("autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")
utils.opt("o", "wrap", false)
utils.opt("o", "completeopt", "menuone,noselect,noinsert")
utils.opt("o", "pumwidth", 15)
utils.opt("o", "pumheight", 7)
utils.opt("o", "pumblend", 20)
utils.opt("b", "expandtab", true)
utils.opt("b", "shiftwidth", indent)
utils.opt("b", "smartindent", true)
utils.opt("b", "autoindent", true)
utils.opt("b", "copyindent", true)
utils.opt("b", "preserveindent", true)
utils.opt("b", "tabstop", indent)
utils.opt("o", "smarttab", true)
utils.opt("o", "hidden", true)
utils.opt("o", "ignorecase", true)
utils.opt("o", "scrolloff", 7)
utils.opt("o", "shiftround", true)
utils.opt("o", "smartcase", true)
utils.opt("o", "splitbelow", true)
utils.opt("o", "splitright", true)
utils.opt("w", "number", true)
utils.opt("o", "clipboard", "unnamed,unnamedplus")
utils.opt("o", "inccommand", "split")
utils.opt("o", "hlsearch", false)
utils.opt("o", "mouse", "a")
utils.opt("o", "breakindent", true)
utils.opt("o", "updatetime", 150)
utils.opt("o", "swapfile", false)
utils.opt("o", "cursorline", true)

require("settings.folding")
local utils = require("utils")
local indent = 4
local cmd = vim.cmd
local vo = vim.opt

vim.g.mapleader = " "

vo.path = "$PWD/**"
vo.cmdheight = 2
vo.showmode = false
vo.conceallevel = 0
vo.listchars = "space:∙"
vo.virtualedit = "block"
vo.ruler = true
vo.laststatus = 2
vo.softtabstop = 4
vo.undofile = false
cmd([[
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
    let g:copilot_no_tab_map = v:true
    set clipboard+=unnamedplus
]])

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

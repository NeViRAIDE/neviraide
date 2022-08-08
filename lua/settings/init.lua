require("settings.folding")

local utils = require("utils")
local indent = 4

vim.g.mapleader = " "
vim.g.python3_host_prog = '/usr/bin/python'

utils.opt("o", "path", "$PWD/**")
utils.opt("o", "fileformats", "unix")
utils.opt("o", "listchars", "space:∙")
utils.opt("o", "virtualedit", "block")
utils.opt("o", "completeopt", "menuone,noselect,noinsert")
utils.opt("o", "clipboard", "unnamed,unnamedplus")
utils.opt("o", "inccommand", "split")
utils.opt("o", "mouse", "a")

utils.opt("o", "conceallevel", 0)
utils.opt("o", "laststatus", 3)
utils.opt("o", "softtabstop", 4)
utils.opt("o", "scrolloff", 7)
utils.opt("o", "pumheight", 7)
utils.opt("o", "pumwidth", 15)
utils.opt("o", "pumblend", 20)
utils.opt("o", "updatetime", 150)

utils.opt("o", "ruler", true)
utils.opt("o", "lazyredraw", true)
utils.opt("o", "magic", true)
utils.opt("o", "number", true)
utils.opt("o", "relativenumber", true)
utils.opt("o", "termguicolors", true)
utils.opt("o", "smarttab", true)
utils.opt("o", "hidden", true)
utils.opt("o", "ignorecase", true)
utils.opt("o", "shiftround", true)
utils.opt("o", "smartcase", true)
utils.opt("o", "splitbelow", true)
utils.opt("o", "splitright", true)
utils.opt("o", "breakindent", true)
utils.opt("o", "cursorline", true)

utils.opt("o", "swapfile", false)
utils.opt("o", "showmode", false)
utils.opt("o", "undofile", false)
utils.opt("o", "wrap", false)
utils.opt("o", "hlsearch", false)

utils.opt("b", "tabstop", indent)
utils.opt("b", "shiftwidth", indent)

utils.opt("b", "expandtab", true)
utils.opt("b", "smartindent", true)
utils.opt("b", "autoindent", true)
utils.opt("b", "copyindent", true)
utils.opt("b", "preserveindent", true)

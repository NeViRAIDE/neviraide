require("settings.folding")
require("settings.notify")
local utils = require("utils")
local indent = 4
local cmd = vim.cmd
local vo = vim.opt

vim.g.mapleader = " "
vim.g.python3_host_prog = '/usr/bin/python3.10'

vo.path = "$PWD/**"
vo.showmode = false
vo.conceallevel = 0
vo.listchars = "space:∙"
vo.virtualedit = "block"
vo.ruler = true
vo.laststatus = 3
vo.softtabstop = 4
vo.undofile = false
cmd([[
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    set clipboard+=unnamedplus
    set nu rnu
    autocmd FileType lsp-installer lua vim.api.nvim_win_set_config(0, { border = "rounded" })
]])
-- TODO: add this strings to config correctly
--autocmd FileType NullLsInfo lua vim.api.nvim_win_set_config(0, { border = "rounded" })
-- let g:loaded_python3_provider = 1

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
utils.opt("o", "clipboard", "unnamed,unnamedplus")
utils.opt("o", "inccommand", "split")
utils.opt("o", "hlsearch", false)
utils.opt("o", "mouse", "a")
utils.opt("o", "breakindent", true)
utils.opt("o", "updatetime", 150)
utils.opt("o", "swapfile", false)
utils.opt("o", "cursorline", true)

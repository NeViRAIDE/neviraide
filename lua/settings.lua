local cmd = vim.cmd
-- [[ General Settings ]] --------------------------------------------------- ]]
-- {{{
--- Leader key {{{
vim.g.mapleader = " "
vim.g.maplocalleader = ','
--- }}}
--- Tab Configuration {{{
vim.cmd('set expandtab')
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.preserveindent = true
--- }}}
--- Numbering {{{
vim.opt.number = true
--- }}}
--- Misc {{{
vim.opt.path = '$PWD/**'
-- vim.opt.cmdheight = 2
vim.opt.showmode = false
vim.opt.conceallevel = 0
vim.opt.listchars = 'space:-'
vim.opt.virtualedit = "block"
vim.opt.mouse = 'a'
vim.opt.mousefocus = true
vim.opt.ruler = true
vim.opt.inccommand = "split"

-- Folds
vim.opt.foldenable = true
vim.opt.foldmethod = 'marker'

-- Scroll margin
-- vim.opt.scrolloff = 4

-- Encoding
-- vim.opt.encoding = 'utf-8'
-- vim.opt.fileencoding = 'utf-8'

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Status line
vim.opt.laststatus = 2

-- Undo
vim.opt.undofile = false

-- Completion
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.pumwidth = 15
vim.opt.pumheight = 7
vim.opt.pumblend = 20

-- Update times
vim.opt.updatetime = 150

-- Cursor Line Nr
cmd('set cursorline')
cmd('set cursorlineopt=number')

cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')
--- prev set {{{
-- local utils = require('utils')
-- 
-- local cmd = vim.cmd
-- local indent = 2
-- 
-- cmd 'syntax enable'
-- cmd 'filetype plugin indent on'
-- cmd 'set undofile'
-- cmd 'set shortmess+=c'
-- 
-- utils.opt('o', 'completeopt', 'menuone,noselect,noinsert')
-- utils.opt('o', 'pumwidth', 15)
-- utils.opt('o', 'pumheight', 7)
-- utils.opt('o', 'pumblend', 20)
-- 
-- utils.opt('b', 'expandtab', true)
-- utils.opt('b', 'shiftwidth', indent)
-- utils.opt('b', 'smartindent', true)
-- utils.opt('b', 'autoindent', true)
-- utils.opt('b', 'copyindent', true)
-- utils.opt('b', 'preserveindent', true)
-- utils.opt('b', 'tabstop', indent)
-- utils.opt('o', 'smarttab', true)
-- utils.opt('o', 'hidden', true)
-- utils.opt('o', 'ignorecase', true)
-- utils.opt('o', 'scrolloff', 4 )
-- utils.opt('o', 'shiftround', true)
-- utils.opt('o', 'smartcase', true)
-- utils.opt('o', 'splitbelow', true)
-- utils.opt('o', 'splitright', true)
-- utils.opt('o', 'wildmode', 'list:longest')
-- utils.opt('w', 'number', true)
-- utils.opt('o', 'clipboard','unnamed,unnamedplus')
-- utils.opt('o', 'inccommand', 'split')
-- utils.opt('o', 'hlsearch', false)
-- utils.opt('o', 'mouse', 'a')
-- utils.opt('o', 'breakindent', true)
-- utils.opt('o', 'updatetime', 150)
-- utils.opt('w', 'signcolumn', 'yes')
-- utils.opt('o', 'swapfile', false)
-- utils.opt('o', 'writebackup', false)
-- utils.opt('o', 'cursorline', true)
-- utils.opt('o', 'cursorlineopt', 'number')
--}}}

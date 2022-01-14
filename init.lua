local g = vim.g
local utils = require("utils")
g.mapleader = " "

utils.map("n", "<F3>", "<cmd>WhichKey<CR>", { noremap = true, silent = true })

require("plugins")
require("lsp_lua")
require("config")
require("settings")

vim.opt.shadafile = ""
vim.opt.termguicolors = true
vim.cmd([[
	doautocmd BufRead
	filetype on
	filetype plugin indent on
	syntax enable
]])

vim.defer_fn(function()
	vim.cmd([[
		set t_ut=
		silent! bufdo e
		PackerLoad impatient.nvim
		PackerLoad nvim-treesitter
		lua require'colorizer'.setup()
	]])
end, 15)

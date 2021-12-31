local g = vim.g
local utils = require("utils")
g.mapleader = " "

utils.map("n", "<F3>", "<cmd>WhichKey<CR>", {noremap = true, silent = true})
utils.map("n", "<F4>", ":Lspsaga open_floaterm<CR>", {silent = true})
utils.map("t", "<F4>", [[<C-\><C-n>:Lspsaga close_floaterm<CR>]], {silent = true})

g.loaded_gzip = false
g.loaded_matchit = false
g.loaded_netrwPlugin = false
g.loaded_tarPlugin = false
g.loaded_zipPlugin = false
g.loaded_man = false
g.loaded_2html_plugin = false
g.loaded_remote_plugins = false

require("plugins")
require("lsp_lua")
require("config")
require("settings")

vim.opt.shadafile = ""
vim.opt.termguicolors = true
vim.cmd [[
	doautocmd BufRead
	filetype on
	filetype plugin indent on
	syntax enable
	colorscheme onedark
]]

vim.defer_fn(
    function()
        vim.cmd [[
		set t_ut=
		silent! bufdo e
		PackerLoad impatient.nvim
		PackerLoad nvim-treesitter
		lua require'colorizer'.setup()
	]]
    end,
    15
)

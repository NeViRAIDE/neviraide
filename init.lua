local g = vim.g
g.mapleader = " "

vim.api.nvim_set_keymap("n", "<F3>", "<cmd>WhichKey<CR>",
                        {noremap = true, silent = true})

-- FIX: make toggle float terminal!!!
-- vim.api.nvim_set_keymap("n", "<F4>", "<cmd>lua require('lspsaga.floaterm').open_float_terminal()",
--                         {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<F4>", "<C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>",
--                         {tnoremap = true, silent = true})

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

vim.defer_fn(function()
    vim.cmd [[
		set t_ut=
		silent! bufdo e
		PackerLoad impatient.nvim
		PackerLoad nvim-treesitter
		lua require'colorizer'.setup()
	]]
end, 15)

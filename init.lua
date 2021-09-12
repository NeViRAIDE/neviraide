-- Map leader to space
vim.g.mapleader = " "

vim.g.loaded_gzip = false
vim.g.loaded_matchit = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_man = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false

require("plugins")
require("keymappings")
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

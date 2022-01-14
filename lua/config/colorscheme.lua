local utils = require("utils")

vim.cmd([[autocmd ColorScheme * highlight CursorLineNr guibg=none guifg=#c678DD gui=bold]])
vim.cmd([[autocmd ColorScheme * highlight CursorLine guibg=none]])
vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=none]])
vim.cmd([[autocmd ColorScheme * highlight FloatBorder guifg=gray guibg=none]])
vim.cmd([[autocmd ColorScheme * highlight Diagnostic guifg=yellow gui=italic,bold]])

utils.opt("o", "termguicolors", true)

local onedark = require("onedark")
onedark.setup({
	transparent = true,
	term_colors = true,
	diagnostics = {
		background = false,
	},
	code_style = {
		strings = "italic",
		keywords = "italic",
	},
})
onedark.load()

local utils = require("utils")

vim.cmd([[autocmd ColorScheme * highlight CursorLineNr guibg=none guifg=#c678DD gui=bold]])
vim.cmd([[autocmd ColorScheme * highlight CursorLine guibg=none]])
vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=none]])
vim.cmd([[autocmd ColorScheme * highlight FloatBorder guifg=Gray guibg=none]])
vim.cmd([[autocmd ColorScheme * highlight Diagnostic guifg=Yellow gui=italic,bold]])
vim.cmd([[autocmd ColorScheme * highlight SidebarNvimFilesDirectory guifg=White]])
vim.cmd([[autocmd ColorScheme * highlight SidebarNvimSectionSeperator guifg=#282c34]])
vim.cmd([[autocmd ColorScheme * highlight Folded gui=italic guifg=#d7a5e6]])
vim.cmd([[autocmd ColorScheme * highlight FoldColumn gui=none guifg=#d7a5e6 guibg=none]])

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

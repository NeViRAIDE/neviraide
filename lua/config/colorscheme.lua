local utils = require("utils")

vim.cmd([[
    autocmd ColorScheme * highlight CursorLineNr guibg=none guifg=#c678DD gui=bold
    autocmd ColorScheme * highlight CursorLine guibg=none
    autocmd ColorScheme * highlight NormalFloat guibg=none
    autocmd ColorScheme * highlight FloatBorder guifg=Gray guibg=none
    autocmd ColorScheme * highlight Diagnostic guifg=Yellow gui=italic,bold
    autocmd ColorScheme * highlight SidebarNvimFilesDirectory guifg=White
    autocmd ColorScheme * highlight SidebarNvimSectionSeperator guifg=#282c34
    autocmd ColorScheme * highlight Folded gui=italic,bold guifg=#d7a5e6
    autocmd ColorScheme * highlight FoldColumn gui=none guifg=#d7a5e6 guibg=none
    autocmd ColorScheme * highlight CopilotSuggestion guifg=#555555 ctermfg=8 gui=italic
]])

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

local utils = require("utils")

utils.opt("o", "termguicolors", true)

local onedark = require("onedark")
onedark.setup({
	highlights = {
		TSKeywordFunction = { fg = "#c678dd", fmt = "italic,bold" },
		TSInclude = { fg = "#c678dd", fmt = "italic,bold" },
		CursorLine = { bg = "none" },
		CursorLineNr = { bg = "none", fg = "#c678dd", fmt = "bold" },
		NormalFloat = { bg = "none" },
		FloatBorder = { fg = "Gray", bg = "none" },
		Diagnostic = { fg = "Yellow", fmt = "italic,bold,underline" },
		SidebarNvimFilesDirectory = { fg = "White" },
		SidebarNvimSectionSeperator = { fg = "#282c34" },
		CopilotSuggestion = { fg = "#555555", ctermfg = 8 },
		Folded = { fg = "#5c6370" },
		-- Comment = { fmt = "bold" },
	},
	transparent = true,
	term_colors = true,
	diagnostics = {
		background = false,
	},
	code_style = {
		strings = "italic",
		keywords = "italic,bold",
	},
})
onedark.load()

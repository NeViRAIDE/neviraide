local sidebar = require("sidebar-nvim")

local opts = {
	open = true,
	side = "right",
	hide_statusline = true,
	initial_width = 40,
	sections = {
	    "datetime",
		"files",
		"git",
		"diagnostics",
		"todos",
	},
	disable_closing_prompt = true,
	files = {
		icon = "",
		show_hidden = true,
	},
	todos = {
		icon = "",
		initially_closed = false,
	},
	datetime = {
		icon = "",
		format = "%A, %d %B %Y, %H:%M:%S",
	},
	section_separator = { "", "-----------------------------------", "" },
}
sidebar.setup(opts)

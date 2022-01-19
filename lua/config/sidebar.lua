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
	disable_closing_promt = false,
	files = {
		icon = "",
		show_hidden = false,
	},
	todos = {
		icon = "",
		initially_closed = true,
	},
	datetime = {
		icon = "",
		format = "%A, %d %B %Y, %H:%M:%S",
		clocks = {
			{ name = "in korea" },
		},
	},
}
sidebar.setup(opts)

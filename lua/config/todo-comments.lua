require("todo-comments").setup({
	signs = true,
	sign_priority = 8,
	keywords = {
		FIX = { icon = " ", color = "error" },
		TODO = { icon = " ", color = "info" },
		HACK = { icon = " ", color = "#FBBF24" },
		WARN = { icon = " ", color = "warning" },
		PERF = { icon = " ", color = "hint" },
		NOTE = { icon = " ", color = "#10B981" },
	},
	merge_keywords = true,
	highlight = {
		before = "",
		keyword = "wide",
		after = "fg",
		pattern = [[.*<(KEYWORDS)\s*:]],
		comments_only = true,
		max_line_len = 400,
	},
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
		},
		pattern = [[\b(KEYWORDS):]],
	},
})

local telescope_actions = require("telescope.actions.set")

local fixfolds = {
	attach_mappings = function(_)
		telescope_actions.select:enhance({
			post = function()
				vim.cmd(":normal! zx")
			end,
		})
		return true
	end,
}

require("telescope").setup({
	pickers = {
		buffers = fixfolds,
		file_browser = fixfolds,
		find_files = fixfolds,
		git_files = fixfolds,
		grep_string = fixfolds,
		live_grep = fixfolds,
		oldfiles = fixfolds,
	},
	defaults = {
		prompt_prefix = " 🔍 ",
		selection_caret = "➤ ",
		dynamic_preview_title = true,
	},
})

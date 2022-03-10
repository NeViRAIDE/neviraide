require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = false,
	char = "┊",
})
local g = vim.g
g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard", "packer", "alpha", "startup" }
-- g.indent_blankline_buftype_exclude = { "terminal", "nvim-lsp-installer" }
g.indent_blankline_show_first_indent_level = false
g.indentLine_char = "┊"

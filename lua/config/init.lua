require("config.colorscheme")
require("config.telescope")
require("config.todo-comments")
require("config.tree-sitter")
require("config.nvim-tree")
require("config.indent-blankline")
require("config.which_key")

require("bufferline").setup()
require("nvim-autopairs").setup({})
require("nvim_comment").setup()

-- null-ls {{{
local null_ls = require("null-ls")
local my_sources = {
	-- null_ls.builtins.formatting.djhtml,
	null_ls.builtins.diagnostics.jsonlint,
	null_ls.builtins.code_actions.eslint,
	null_ls.builtins.diagnostics.stylelint,
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.diagnostics.flake8,
	null_ls.builtins.formatting.black,
	null_ls.builtins.formatting.autopep8,
	null_ls.builtins.formatting.isort,
	null_ls.builtins.formatting.stylua,
}
null_ls.setup({ sources = my_sources })
-- }}}
-- dashboard {{{
vim.g.dashboard_preview_command = "cat"
vim.g.dashboard_preview_pipeline = "lolcat"
vim.g.dashboard_preview_file = "~/.config/nvim/lua/config/dash_preview"
vim.g.dashboard_preview_file_height = 17
vim.g.dashboard_preview_file_width = 90

vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_footer = { "...maybe here will be installed plugin counter..." }

vim.g.dashboard_custom_shortcut = {
	last_session = "SPACE s l",
	find_history = "SPACE t r",
	find_file = "SPACE t f",
	new_file = "Create a new empty file",
	change_colorscheme = '"OneDark" by default',
	find_word = "SPACE t w",
	book_marks = "SPACE t m",
}
-- }}}

require("lsp-colors").setup({
	Error = "#db4b4b",
	Warning = "#e0af68",
	Information = "#0db9d7",
	Hint = "#10B981",
})

require("config.lualine")
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)

require("config.colorscheme")
require("config.indent-blankline")
require("config.sidebar")
require("config.telescope")
require("config.todo-comments")
require("config.tree-sitter")
require("config.which_key")
require("nvim-autopairs").setup({})
require("nvim_comment").setup()

local null_ls = require("null-ls")
local my_sources = {
	null_ls.builtins.diagnostics.flake8,
	null_ls.builtins.diagnostics.jsonlint,
	null_ls.builtins.code_actions.eslint,
	null_ls.builtins.diagnostics.stylelint,
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.formatting.black,
	null_ls.builtins.formatting.autopep8,
	null_ls.builtins.formatting.isort,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.djhtml.with({
		extra_args = function(params)
			return {
				"--tabwidth",
				vim.api.nvim_buf_get_option(params.bufnr, "shiftwidth"),
			}
		end,
	}),
}
null_ls.setup({ sources = my_sources })

require("lsp-colors").setup({
	Error = "#db4b4b",
	Warning = "#e0af68",
	Information = "#0db9d7",
	Hint = "#10B981",
})

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
vim.api.nvim_exec(
	[[
    augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
]],
	false
)

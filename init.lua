require 'settings'
require 'plugins'
require 'config'
require 'lsp'

vim.api.nvim_command [[
	doautocmd BufRead
	filetype on
	filetype plugin indent on
	syntax enable
]]

vim.defer_fn(function()
    vim.api.nvim_command [[
		set t_ut=
		silent! bufdo e
		PackerLoad nvim-treesitter
	]]
end, 15)

require 'plugins'
require 'lsp_lua'
require 'config'
require 'settings'

vim.cmd [[
	doautocmd BufRead
	filetype on
	filetype plugin indent on
	syntax enable
]]

vim.defer_fn(function()
    vim.cmd [[
		set t_ut=
		silent! bufdo e
		PackerLoad nvim-treesitter
		lua require'colorizer'.setup()
	]]
end, 15)

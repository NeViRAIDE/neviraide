local utils = require('utils')
local cmd = vim.cmd

utils.opt('o', 'termguicolors', true)
-- utils.opt('g', 'onedark_terminal_italics', 2)
cmd 'colorscheme onedark'
vim.g.onedark_terminal_italics = 2


local neviraide = require('NEVIRAIDE')

local o = vim.opt

for _, provider in ipairs({ 'node', 'perl', 'python3', 'ruby' }) do
  vim.g['loaded_' .. provider .. '_provider'] = 0
end

o.whichwrap:append('<>[]hl')
o.shortmess:append({ W = true, I = true, c = true })
o.laststatus = 3
o.showmode = false
o.conceallevel = 3
o.spelllang = { 'en' }
o.pumblend = 10
o.pumheight = 10
o.clipboard = 'unnamedplus'
o.cursorline = true
o.confirm = true
o.scrolloff = 7
o.hlsearch = false
o.completeopt = 'menuone,noselect,noinsert'
o.showmatch = true
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.fillchars = { eob = ' ' }
o.ignorecase = true
o.smartcase = true
o.mouse = 'a'
o.mousemoveevent = true
o.number = neviraide.ui.number
o.relativenumber = neviraide.ui.relative_numbers
o.numberwidth = 2
o.ruler = false
o.signcolumn = 'yes'
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.timeoutlen = 400
o.undofile = true
o.updatetime = 250
o.sessionoptions =
  'blank,buffers,curdir,folds,help,options,terminal,globals,localoptions,tabpages'

vim.g.everforest_better_performance = 1
vim.g.everforest_background = neviraide.ui.background_pallete

require('core.autocommands')
require('core.highlights')

vim.o.background = neviraide.ui.background

vim.cmd.colorscheme(neviraide.ui.theme)

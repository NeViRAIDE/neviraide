vim.g.neviraide_themes_cache = vim.fn.stdpath('data') .. '/neviraide_ui/'
vim.g.neviraide_theme = NEVIRAIDE().theme
vim.g.transparency = NEVIRAIDE().transparency

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
o.cursorline = NEVIRAIDE().cursor_line
o.cursorcolumn = NEVIRAIDE().cursor_column
o.number = NEVIRAIDE().numbers
o.relativenumber = NEVIRAIDE().relative_numbers
o.confirm = true
o.scrolloff = 7
o.hlsearch = false
o.completeopt = 'menuone,noselect,noinsert'
o.showmatch = true
o.expandtab = true
o.smartindent = true
o.shiftwidth = NEVIRAIDE().indents
o.tabstop = NEVIRAIDE().indents
o.softtabstop = NEVIRAIDE().indents
o.fillchars = { eob = ' ' }
o.ignorecase = true
o.smartcase = true
o.mouse = 'a'
o.mousemoveevent = true
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

require('neviraide.autocommands')

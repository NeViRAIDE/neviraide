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

vim.g.transparent_enabled = NEVIRAIDE().transparency

-- g.toggle_theme_icon = "   "
vim.g.transparency = NEVIRAIDE().transparency

-- vim.g.everforest_better_performance = 1
-- vim.g.everforest_background = NEVIRAIDE().background_pallete
-- local my_dict = vim.g.my_dict   --
-- my_dict.field1 = 'value'        -- Instead do
-- vim.g.my_dict = my_dict         --

require('neviraide.autocommands')
require('neviraide.highlights')

o.background = NEVIRAIDE().background

-- vim.cmd.colorscheme(NEVIRAIDE().theme)
-- vim.cmd.colorscheme('habamax')

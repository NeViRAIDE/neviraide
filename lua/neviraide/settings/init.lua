require('neviraide.settings.global')
local N = NEVIRAIDE()
local o = vim.opt

o.whichwrap:append('<>[]hl')
o.shortmess:append({ W = true, I = true, c = true })
o.laststatus = 3
o.showmode = false
o.concealcursor = 'nc'
o.conceallevel = 3
o.pumheight = 10
o.clipboard = 'unnamedplus'
o.confirm = true
o.scrolloff = 7
o.hlsearch = false
o.completeopt = 'menuone,noselect,noinsert'
o.showmatch = true
o.expandtab = true
o.smartindent = true
o.smoothscroll = true
o.cursorline = N.cursor_line
o.cursorcolumn = N.cursor_column
o.number = N.numbers_enabled
o.relativenumber = N.relative_numbers
o.shiftwidth = N.indents
o.tabstop = N.indents
o.softtabstop = N.indents
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

-- NOTE: folds or not?!

o.fillchars = {
  --   foldopen = '',
  --   foldclose = '',
  --   -- fold = "⸱",
  --   fold = ' ',
  --   foldsep = ' ',
  --   diff = '╱',
  eob = ' ',
}
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = "v:lua.require'neviraide.utils'.foldexpr()"

-- vim.o.formatexpr = "v:lua.require'neviraide.utils'.formatexpr()"

require('neviraide.autocommands')

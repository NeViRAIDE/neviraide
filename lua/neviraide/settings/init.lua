require('neviraide.settings.global')
local N = NEVIRAIDE()
local o = vim.opt

o.whichwrap:append('<>[]hl')
o.shortmess:append({ W = true, I = true, c = true })
o.laststatus = 3
o.showmode = false
o.cmdheight = 0
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
o.cursorline = N.ui.cursor_line
o.cursorcolumn = N.ui.cursor_column
o.number = N.ui.numbers_enabled
o.relativenumber = N.ui.relative_numbers
o.shiftwidth = N.ui.indents
o.tabstop = N.ui.indents
o.softtabstop = N.ui.indents
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

if vim.fn.has('nvim-0.10') == 1 then o.smoothscroll = true end

-- NOTE: folds or not?!

o.fillchars = {
  --   foldopen = '',
  --   foldclose = '',
  --   -- fold = "⸱",
  --   fold = ' ',
  --   foldsep = ' ',
  diff = '╱',
  eob = ' ',
}
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = "v:lua.require'neviraide.utils'.foldexpr()"

-- vim.o.formatexpr = "v:lua.require'neviraide.utils'.formatexpr()"

require('neviraide.autocommands')

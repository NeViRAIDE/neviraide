local g = vim.g
local conf = NEVIRAIDE()
------------------------------
---@type string
g.neviraide_themes_cache = vim.fn.stdpath('data') .. '/neviraide_ui/'
------------------------------
---@type string
g.neviraide_theme = conf.theme
------------------------------
---@type boolean
g.transparency = conf.transparency
------------------------------
---@type string
g.borders = conf.border
------------------------------
---@type boolean
g.nonicons = conf.nonicons
------------------------------
local o = vim.opt

for _, provider in ipairs({ 'node', 'perl', 'python3', 'ruby' }) do
  g['loaded_' .. provider .. '_provider'] = 0
end

o.whichwrap:append('<>[]hl')
o.shortmess:append({ W = true, I = true, c = true })
------------------------------
--The value of this option influences when the last window will have a
--status line:
--	0: never
--	1: only if there are at least two windows
--	2: always
--	3: always and ONLY the last window
--The screen looks nicer with a status line if you have several
--windows, but it takes another screen line. `status-line`
o.laststatus = 3
------------------------------
--If in Insert, Replace or Visual mode put a message on the last line.
--The `hl-ModeMsg` highlight group determines the highlighting.
--The option has no effect when `cmdheight` is zero.
o.showmode = false
------------------------------
--Sets the modes in which text in the cursor line can also be concealed.
--When the current mode is listed then concealing happens just like in
--other lines.
--  n		Normal mode
--  v		Visual mode
--  i		Insert mode
--  c		Command line editing, for `incsearch`
--'v' applies to all lines in the Visual area, not only the cursor.
--A useful value is "nc".  This is used in help files.  So long as you
--are moving around text is concealed, but when starting to insert text
--or selecting a Visual area the concealed text is displayed, so that
--you can see what you are doing.
--Keep in mind that the cursor position is not always where it's
--displayed.  E.g., when moving vertically it may change column.
o.concealcursor = 'nc'
------------------------------
--Determine how text with the "conceal" syntax attribute `:syn-conceal`
--is shown:
--***Value***		***Effect***
--0		Text is shown normally
--1		Each block of concealed text is replaced with one
--		character.  If the syntax item does not have a custom
--		replacement character defined (see `:syn-cchar`) the
--		character defined in `listchars` is used.
--		It is highlighted with the "Conceal" highlight group.
--2		Concealed text is completely hidden unless it has a
--		custom replacement character defined (see
--		`:syn-cchar`).
--3		Concealed text is completely hidden.
--Note: in the cursor line concealed text is not hidden, so that you can
--edit and copy the text.  This can be changed with the `concealcursor`
--option.
o.conceallevel = 3
------------------------------
o.spelllang = { 'en_us' }
o.pumheight = 10
o.clipboard = 'unnamedplus'
o.confirm = true
o.scrolloff = 7
o.hlsearch = false
o.completeopt = 'menuone,noselect,noinsert'
o.showmatch = true
o.expandtab = true
o.smartindent = true
o.cursorline = conf.cursor_line
o.cursorcolumn = conf.cursor_column
o.number = conf.numbers_enabled
o.relativenumber = conf.relative_numbers
o.shiftwidth = conf.indents
o.tabstop = conf.indents
o.softtabstop = conf.indents
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

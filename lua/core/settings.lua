local o = vim.opt

for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

o.whichwrap:append "<>[]hl"
o.shortmess:append({ W = true, I = true, c = true })
o.laststatus = 3
o.showmode = false
o.conceallevel = 3
o.spelllang = { "en" }
o.pumblend = 10
o.pumheight = 10
o.clipboard = "unnamedplus"
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
o.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"
o.mousemoveevent = true
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.ruler = false
o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.timeoutlen = 400
o.undofile = true
o.updatetime = 250
o.sessionoptions = 'blank,buffers,curdir,folds,help,options,tabpages,terminal,globals,localoptions,tabpages'
-- TODO: add fold method

require("core.autocommands")
require("core.highlights")

vim.cmd.colorscheme('catppuccin-frappe')

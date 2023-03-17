require('settings.autocommands')

vim.opt.shortmess:append('sI')

for _, provider in ipairs({ 'perl', 'ruby', 'python3' }) do
  vim.g['loaded_' .. provider .. '_provider'] = 0
end

local settings = {
  -- Visual
  completeopt = 'menuone,noselect,noinsert',
  confirm = true,
  cursorline = true,
  hlsearch = false,
  pumblend = 15,
  scrolloff = 7,
  showmatch = true,
  showmode = false,
  termguicolors = true,
  winblend = 15,
  wrap = false,

  -- Indenting
  shiftround = true,
  shiftwidth = 4,
  tabstop = 4,
  softtabstop = 4,
  expandtab = true,
  smartindent = true,
  breakindent = true,
  copyindent = true,
  preserveindent = true,

  -- Numbers
  number = true,
  relativenumber = true,
  ruler = false,

  -- Split window position
  splitbelow = true,
  splitright = true,

  -- Other
  clipboard = 'unnamed,unnamedplus',
  fileformats = 'unix',
  fileencoding = 'utf-8',
  ignorecase = true,
  inccommand = 'split',
  laststatus = 3,
  listchars = 'space: ',
  mouse = 'a',
  path = '$PWD/**',
  sessionoptions = 'blank,buffers,curdir,folds,help,options,tabpages,terminal,globals,localoptions,tabpages',
  smartcase = true,
  swapfile = false,
  updatetime = 150,
  virtualedit = 'block',
}

for i, set in pairs(settings) do
  vim.opt[i] = set
end

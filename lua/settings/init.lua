require('settings.autocommands')
require('settings.folding')

vim.g.mapleader = ' '
vim.g.python3_host_prog = '/usr/bin/python'

local disabled_built_ins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
  'matchit',
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 1
end

local settings = {
  path = '$PWD/**',
  sessionoptions = 'blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal',
  showmatch = true,
  fileformats = 'unix',
  fileencoding = 'utf-8',
  listchars = 'space: ',
  virtualedit = 'block',
  completeopt = 'menuone,noselect,noinsert',
  clipboard = 'unnamed,unnamedplus',
  inccommand = 'split',
  mouse = '',
  winblend = 15,
  conceallevel = 0,
  laststatus = 3,
  softtabstop = 4,
  tabstop = 4,
  shiftwidth = 4,
  scrolloff = 7,
  pumheight = 7,
  pumwidth = 15,
  pumblend = 15,
  updatetime = 150,
  ruler = true,
  lazyredraw = true,
  magic = true,
  number = true,
  relativenumber = true,
  termguicolors = true,
  smarttab = true,
  hidden = true,
  ignorecase = true,
  shiftround = true,
  smartcase = true,
  splitbelow = true,
  splitright = true,
  breakindent = true,
  cursorline = true,
  swapfile = false,
  showmode = false,
  undofile = false,
  wrap = false,
  hlsearch = false,
  expandtab = true,
  smartindent = true,
  autoindent = true,
  copyindent = true,
  preserveindent = true,
  autoread = true,
}
for i, set in pairs(settings) do
  vim.opt[i] = set
end

vim.cmd([[
    let &fcs='eob: '
    filetype plugin on
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
]])

_G.color = {
  bg = '#070707',
  fg = '#bbc2cf',
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  lightGreen = 'lightGreen',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67',
  none = 'none',
  indigo = '#6621ef',
  grey = 'Grey',
  visual = '#444c4d',
  darkYellow = 'DarkYellow',
}

local utils = require('neviraide.utils')

dofile(vim.g.neviraide_themes_cache .. 'whichkey')
utils.mappings()()

return {
  plugins = { spelling = { enabled = true } },
  key_labels = {
    ['<space>'] = 'Space',
    ['<cr>'] = 'Enter',
    ['<CR>'] = 'Enter',
    ['<tab>'] = 'TAB',
    ['<c-w>'] = 'Ctrl + w',
    ['<C-S>'] = 'Ctrl + s',
    ['<C-L>'] = 'Ctrl + l',
    ['<C-Bslash>'] = 'Ctrl + \\',
    ['<C-P>'] = 'Ctrl + p',
    ['<C-H>'] = 'Ctrl + h',
    ['<C-l>'] = 'Ctrl + l',
  },
  popup_mappings = { scroll_down = '<c-j>', scroll_up = '<c-k>' },
  window = {
    winblend = 5,
    border = vim.g.borders,
    margin = { 1, 5, 1, 5 },
  },
  layout = {
    -- TODO: do dynamically
    height = { min = 5, max = 80 },
    width = { min = 20, max = 70 },
    spacing = 14,
    align = 'center',
  },
  hidden = {
    '<Plug>',
    'require',
    'execute v:count .',
    '<silent>',
    ':',
    '<Cmd>',
    '<CR>',
    'call',
    'lua',
    '^:',
    '^ ',
    '("nvim-treesitter.textsubjects")',
  },
}

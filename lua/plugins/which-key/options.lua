local utils = require('neviraide.utils')

dofile(vim.g.neviraide_themes_cache .. 'whichkey')
utils.mappings()()

return {
  plugins = { spelling = { enabled = true } },
  key_labels = {
    ['<space>'] = 'Space',
    ['<leader>'] = 'Leader(Space)',

    ['<cr>'] = 'Enter',
    ['<CR>'] = 'Enter',

    ['<Tab>'] = 'Tab',
    ['<S-Tab>'] = 'Shift + Tab',

    ['<C-S>'] = 'Ctrl + s',
    ['<C-L>'] = 'Ctrl + l',
    ['<C-Bslash>'] = 'Ctrl + \\',
    ['<C-/>'] = 'Ctrl + /',
    ['<C-P>'] = 'Ctrl + p',

    ['<c-w>'] = 'Ctrl + w',
    ['<C-H>'] = 'Ctrl + h',
    ['<C-l>'] = 'Ctrl + l',
    ['<C-J>'] = 'Ctrl + j',
    ['<C-K>'] = 'Ctrl + k',
    ['<C-N>'] = 'Ctrl + n',

    ['<ScrollWheelUp>'] = 'Mouse wheel up',
    ['<ScrollWheelDown>'] = 'Mouse wheel down',

    ['<M-d>'] = 'Alt + d',
    ['<M-v>'] = 'Alt + v',
    ['<M-f>'] = 'Alt + f',
    ['<M-s>'] = 'Alt + s',
    ['<M-h>'] = 'Alt + h',
  },
  popup_mappings = { scroll_down = '<c-j>', scroll_up = '<c-k>' },
  window = {
    winblend = vim.g.blend,
    border = vim.g.borders,
    margin = { 1, 5, 1, 5 },
  },
  layout = {
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

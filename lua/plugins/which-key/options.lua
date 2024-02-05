local utils = require('neviraide.utils')

require('plugins.which-key.mappings')()

dofile(vim.g.ntc .. 'whichkey')

return {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = 'Comments' },
  motions = {
    count = true,
  },
  icons = {
    -- TODO: nonicons
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    separator = '➜', -- symbol used between a key and it's label
    group = '+', -- symbol prepended to a group
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  triggers = 'auto', -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specifiy a list manually
  -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
  triggers_nowait = {
    -- marks
    '`',
    "'",
    'g`',
    "g'",
    -- registers
    '"',
    '<c-r>',
    -- spelling
    'z=',
  },
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for keymaps that start with a native binding
    i = { 'j', 'k' },
    v = { 'j', 'k' },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by default for Telescope
  disable = {
    buftypes = {},
    filetypes = {},
  },
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

    ['<ScrollWheelUp>'] = 'Scroll up',
    ['<ScrollWheelDown>'] = 'Scroll down',

    ['<M-d>'] = 'Alt + d',
    ['<M-v>'] = 'Alt + v',
    ['<M-f>'] = 'Alt + f',
    ['<M-s>'] = 'Alt + s',
    ['<M-h>'] = 'Alt + h',
    ['<M-b>'] = 'Alt + b',
    ['<M-g>'] = 'Alt + g',
  },
  popup_mappings = { scroll_down = '<c-j>', scroll_up = '<c-k>' },
  window = {
    winblend = vim.g.blend,
    border = vim.g.b,
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

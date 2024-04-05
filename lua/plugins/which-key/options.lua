local mappings = require('plugins.which-key.mappings')

return function()
  local i = require('neviraide-ui.icons.utils').icon

  mappings()
  dofile(vim.g.ntc .. 'whichkey')

  return {
    icons = {
      breadcrumb = i('»', 'chevron-right', 0, 1),
      separator = i('➜', 'arrow-right', 0, 1),
      group = i('+', 'plus', 0, 1),
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
      ['<M-r>'] = 'Alt + r',
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
end

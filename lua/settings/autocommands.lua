local opt = require('utils').opt
local auto_cmd = require('utils').autocmd
local multi_auto_cmd = require('utils').autocmd_multi

multi_auto_cmd('NEVIRIDE', {
  {
    'FileType',
    {
      pattern = { 'help', 'man' },
      desc = 'Use q to close the window',
      command = 'nnoremap <buffer> q <cmd>quit<cr>',
    },
  },
  {
    'TextYankPost',
    {
      desc = 'Highlight on yank',
      callback = function(event)
        vim.highlight.on_yank({ higroup = 'Search', timeout = 200 })
      end,
    },
  },
  -- FIX: colorpicker window size
  {
    'WinEnter',
    {
      pattern = 'color-picker',
      callback = function()
        opt('winwidth', 25)
        opt('cursorline', true)
        -- opt('signcolumn', 'auto')
        -- vim.cmd('wincmd =')
      end,
    },
  },
})

multi_auto_cmd('WindowResizing', {
  {
    'WinEnter',
    {
      pattern = '*',
      callback = function()
        opt('winwidth', 85)
        opt('cursorline', true)
        opt('signcolumn', 'auto')
        vim.cmd('wincmd =')
      end,
    },
  },
  {
    'WinLeave',
    {
      pattern = '*',
      callback = function()
        opt('cursorline', false)
        opt('signcolumn', 'no')
      end,
    },
  },
})

auto_cmd(
  'LspFormatting',
  'BufWritePre',
  { command = 'undojoin | LspFormatting' }
)

auto_cmd('ToggleTerm', 'TermOpen', {
  pattern = 'term://*toggleterm#*',
  callback = function()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  end,
})

local term_util = require('neviraide.utils').term_toggle
local i = require('stigmata.utils').icon

return {
  mode = { 't' },
  {
    '<a-h>',
    function() term_util('horizontal') end,
    desc = 'Toggle horizontal terminal',
    icon = i('', 'terminal', 1),
  },
  {
    '<a-f>',
    function() term_util('float') end,
    desc = 'Toggle floating terminal',
    icon = i('', 'terminal', 1),
  },
  {
    '<a-v>',
    function() term_util('vertical') end,
    desc = 'Toggle vertical terminal',
    icon = i('', 'terminal', 1),
  },
  { '<C-h>', '<Cmd>wincmd h<CR>', desc = 'Go to the left window' },
  { '<C-l>', '<Cmd>wincmd l<CR>', desc = 'Go to the right window' },
  { '<C-j>', '<Cmd>wincmd j<CR>', desc = 'Go to the bottom window' },
  { '<C-k>', '<Cmd>wincmd k<CR>', desc = 'Go to the top window' },
  { '<esc>', '<C-\\><C-n>', desc = 'NORMAL mode' },
}

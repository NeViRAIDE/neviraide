local term_util = require('neviraide.utils').term_toggle
local i = require('neviraide.ui.neviraide-ui.icons.utils').icon

return {
  ['<a-h>'] = {
    function() term_util('horizontal') end,
    'Toggle horizontal terminal' .. i('', 'terminal', 1),
  },
  ['<a-f>'] = {
    function() term_util('float') end,
    'Toggle floating terminal' .. i('', 'terminal', 1),
  },
  ['<a-v>'] = {
    function() term_util('vertical') end,
    'Toggle vertical terminal' .. i('', 'terminal', 1),
  },
  ['<C-h>'] = { '<Cmd>wincmd h<CR>', 'Go to the left window' },
  ['<C-l>'] = { '<Cmd>wincmd l<CR>', 'Go to the right window' },
  ['<C-j>'] = { '<Cmd>wincmd j<CR>', 'Go to the bottom window' },
  ['<C-k>'] = { '<Cmd>wincmd k<CR>', 'Go to the top window' },
  ['<esc>'] = { '<C-\\><C-n>', 'NORMAL mode' },
}

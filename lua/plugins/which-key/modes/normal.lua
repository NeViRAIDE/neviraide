local term_util = require('neviraide.utils').term_toggle
local i = require('stigmata.utils').icon

return {
  require('plugins.which-key.mappings.find'),
  require('plugins.which-key.mappings.git'),
  require('plugins.which-key.mappings.lsp'),
  require('plugins.which-key.mappings.settings'),
  require('plugins.which-key.mappings.utils'),

  { '<ScrollWheelUp>', '<C-y>', desc = 'Scroll up' },
  { '<ScrollWheelDown>', '<C-e>', desc = 'Scroll down' },

  { '<Esc>', '<cmd>noh <CR>', desc = 'Clear highlights' },
  {
    '<c-s>',
    rhs = function()
      if vim.bo.modified then
        vim.api.nvim_exec2('silent! w', { output = false })
        vim.notify(
          vim.fn.expand('%:t'),
          2,
          { title = 'Saved', icon = i('✓', 'check', 0, 1) }
        )
      end
    end,
    desc = 'Save file',
  },

  {
    '<c-n>',
    '<cmd>Neotree reveal toggle left<cr>',
    desc = 'File explorer (Neotree)',
  },
  {
    '<a-s>',
    '<cmd>Neotree document_symbols position=right toggle<cr>',
    desc = 'Document symbols',
  },

  { '<C-h>', '<C-w>h', desc = 'Go to the left window' },
  { '<C-l>', '<C-w>l', desc = 'Go to the right window' },
  { '<C-j>', '<C-w>j', desc = 'Go to the bottom window' },
  { '<C-k>', '<C-w>k', desc = 'Go to the top window' },

  -- TODO: check if, for example, neotree => go to main window and then open terminals
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

  {
    '<a-r>',
    '<cmd>Neotree float remote toggle<CR>',
    desc = 'Toggle netman',
    icon = '',
  },

  {
    '<a-g>',
    '<cmd>Neotree position=right git_status toggle<cr>',
    desc = 'Toggle GIT status (Neotree)',
    icon = i('', 'mark-github', 1),
  },

  { '<leader>', group = 'Plugins and features', icon = i('', 'rocket', 1) },

  {
    '<leader>Q',
    '<cmd>qall<cr>',
    desc = 'Quit',
    icon = i('', 'sign-out', 1),
  },

  -- TODO: silent when no language server
  {
    '<leader>S',
    rhs = function()
      vim.api.nvim_exec2('silent! wa', { output = false })
      vim.notify(
        'All modified files',
        2,
        { title = 'Saved', icon = i('✓', 'check', 0, 1) }
      )
    end,
    desc = 'Save all files',
    icon = ' ',
  },

  {
    '<leader>N',
    '<cmd>lua require("neviraide-ui.utils.new_file")()<cr>',
    desc = 'New file',
    icon = i('', 'plus-circle', 1),
  },
}

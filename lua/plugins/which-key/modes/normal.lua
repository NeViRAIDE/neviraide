local term_util = require('neviraide.utils').term_toggle
local i = require('neviraide-ui.icons.utils').icon

return {
  d = {
    n = {
      '<cmd>NeviraideUINotifyClear<cr>',
      'Dismiss all Notifications' .. i('󰎟', 'inbox', 1),
    },
  },

  ['<ScrollWheelUp>'] = { '<C-y>', 'Scroll up' },
  ['<ScrollWheelDown>'] = { '<C-e>', 'Scroll down' },

  ['<Esc>'] = { ':noh <CR>', 'Clear highlights' },
  ['<c-s>'] = {
    function()
      if vim.bo.modified then
        vim.api.nvim_exec2('silent! w', { output = false })
        vim.notify(
          vim.fn.expand('%:t'),
          2,
          { title = 'Saved', icon = i('✓', 'check', 0, 1) }
        )
      end
    end,
    'Save file',
  },

  ['<c-n>'] = { ':Neotree reveal toggle left<cr>', 'File explorer (Neotree)' },
  ['<a-s>'] = {
    ':Neotree document_symbols position=right toggle<cr>',
    'Document symbols',
  },

  -- ['<c-/>'] = {
  --   function() require('Comment.api').toggle.linewise.current() end,
  --   'Toggle comment' .. i('', 'comment', 1),
  -- },

  ['<tab>'] = {
    function() require('neviraide-ui.buftabline').tabuflineNext() end,
    'Goto to the next buffer',
  },
  ['<S-tab>'] = {
    function() require('neviraide-ui.buftabline').tabuflinePrev() end,
    'Goto to the previous buffer',
  },

  ['<C-h>'] = { '<C-w>h', 'Go to the left window' },
  ['<C-l>'] = { '<C-w>l', 'Go to the right window' },
  ['<C-j>'] = { '<C-w>j', 'Go to the bottom window' },
  ['<C-k>'] = { '<C-w>k', 'Go to the top window' },

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

  ['<a-d>'] = {
    '<cmd>NeviraideUIDashboard<CR>',
    'Toggle dashboard' .. i('󰕮', 'tmux', 1),
  },

  ['<a-r>'] = {
    '<cmd>Neotree float remote toggle<CR>',
    'Toggle netman ',
  },

  ['<a-g>'] = {
    '<cmd>Neotree position=right git_status toggle<cr>',
    'Toggle GIT status (Neotree)' .. i('', 'mark-github', 1),
  },

  ['<leader>'] = {
    name = 'Plugins and features' .. i('', 'rocket', 1),

    b = require('plugins.which-key.mappings.buffers'),
    f = require('plugins.which-key.mappings.find'),
    g = require('plugins.which-key.mappings.git'),
    l = require('plugins.which-key.mappings.lsp'),
    s = require('plugins.which-key.mappings.settings'),
    t = require('plugins.which-key.mappings.tabs'),
    u = require('plugins.which-key.mappings.utils'),

    Q = {
      '<cmd>qall<cr>',
      'Quit' .. i('', 'sign-out', 1),
    },

    S = {
      function()
        vim.api.nvim_exec2('silent! wa', { output = false })
        vim.notify(
          'All modified files',
          2,
          { title = 'Saved', icon = i('✓', 'check', 0, 1) }
        )
      end,
      'Save all files  ',
    },

    N = {
      '<cmd>lua require("neviraide-ui.utils.new_file")()<cr>',
      'New file' .. i('', 'plus-circle', 1),
    },
  },
}

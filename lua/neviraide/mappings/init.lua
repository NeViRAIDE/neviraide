-- TODO: add tabs buttons

local utils = require('neviraide.utils')
local term_util = require('neviraide.utils').term_toggle
local i = require('neviraide-ui.icons.utils').icon

local function save_file()
  if vim.bo.modified then
    vim.api.nvim_exec2('silent! w', { output = false })
    vim.notify(
      'File "' .. vim.fn.expand('%:t') .. '" was saved',
      2,
      { title = 'Saved', icon = i('✓', 'check', 0, 1) }
    )
  end
end

return function()
  utils.wk_reg({
    d = {
      n = {
        function() require('notify').dismiss({ silent = true, pending = true }) end,
        'Dismiss all Notifications' .. i('󰎟', 'inbox', 1),
      },
    },

    ['<ScrollWheelUp>'] = { '<C-y>', 'Scroll up' },
    ['<ScrollWheelDown>'] = { '<C-e>', 'Scroll down' },

    ['<Esc>'] = { ':noh <CR>', 'Clear highlights' },
    ['<c-s>'] = { save_file, 'Save file' },
    ['<c-n>'] = { ':Neotree reveal toggle left<cr>', 'File explorer (Neotree)' },
    ['<a-s>'] = {
      ':Neotree document_symbols position=right toggle<cr>',
      'Document symbols',
    },
    ['<c-/>'] = {
      function() require('Comment.api').toggle.linewise.current() end,
      'Toggle comment' .. i('', 'comment', 1),
    },

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

    ['<a-b>'] = {
      '<cmd>Neotree buffers focus float toggle<cr>',
      'Toggle buffers list (Neotree)' .. i('', 'list-unordered', 1),
    },

    ['<a-g>'] = {
      '<cmd>Neotree position=right git_status toggle<cr>',
      'Toggle GIT status (Neotree)' .. i('', 'mark-github', 1),
    },

    ['<leader>'] = {
      name = 'Plugins and features' .. i('', 'rocket', 1),
      x = {
        function() require('neviraide-ui.buftabline').close_buffer() end,
        'Close buffer' .. i('', 'trash', 1),
      },
      N = {
        '<cmd>lua require("neviraide-ui.utils.new_file")()<cr>',
        'New file' .. i('', 'plus-circle', 1),
      },
      -- m = utils.mappings('markdown_keys'),
      -- s = utils.mappings('settings'),
      l = utils.mappings('lsp'),
      c = utils.mappings('colorpicker'),
      t = utils.mappings('telescope_keys'),
      n = utils.mappings('todos'),
    },
  }, { mode = 'n' })

  utils.wk_reg({
    ['<c-/>'] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      'Toggle comment' .. i('', 'comment', 1),
    },
    p = {
      'p:let @+=@0<CR>:let @"=@0<CR>',
      'Paste (dont copy replaced text)',
    },
  }, { mode = 'v' })

  utils.wk_reg({
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
  }, { mode = 't' })

  utils.wk_reg({
    j = {
      j = {
        '<ESC>',
        'Return to Normal mode',
      },
    },
    k = {
      k = {
        '<ESC>',
        'Return to Normal mode',
      },
    },
  }, { mode = 'i' })
end

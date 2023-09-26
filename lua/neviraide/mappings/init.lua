local utils = require('neviraide.utils')
local term_util = require('neviraide.utils').term_toggle
local icon = require('neviraide-ui.icons.utils').icon

local function save_file()
  if vim.bo.modified then
    vim.api.nvim_exec2('silent! w', { output = false })
    vim.notify(
      'File "' .. vim.fn.expand('%:t') .. '" was saved',
      2,
      { title = 'Saved', icon = icon('✓', 'check', 0, 1) }
    )
  end
end

return function()
  utils.wk_reg({
    d = {
      n = {
        function() require('notify').dismiss({ silent = true, pending = true }) end,
        'Dismiss all Notifications',
      },
    },

    ['<ScrollWheelUp>'] = { 'k', 'Scroll up by one line' },
    ['<ScrollWheelDown>'] = { 'j', 'Scroll down by one line' },
    ['<Esc>'] = { ':noh <CR>', 'Clear highlights' },
    ['<c-s>'] = { save_file, 'Save file' },
    ['<c-n>'] = { ':Neotree reveal toggle left<cr>', 'File explorer' },
    ['<a-s>'] = {
      ':Neotree document_symbols position=right toggle<cr>',
      'Document symbols',
    },
    ['<c-/>'] = {
      function() require('Comment.api').toggle.linewise.current() end,
      'Toggle comment' .. icon('', 'comment', 1),
    },
    ['<tab>'] = {
      function() require('neviraide-ui.buftabline').tabuflineNext() end,
      'Goto next buffer',
    },
    ['<S-tab>'] = {
      function() require('neviraide-ui.buftabline').tabuflinePrev() end,
      'Goto prev buffer',
    },
    ['<C-h>'] = { '<C-w>h', 'Window left' },
    ['<C-l>'] = { '<C-w>l', 'Window right' },
    ['<C-j>'] = { '<C-w>j', 'Window down' },
    ['<C-k>'] = { '<C-w>k', 'Window up' },

    ['<a-h>'] = {
      function() term_util('horizontal') end,
      'Horizontal terminal',
    },
    ['<a-f>'] = {
      function() term_util('float') end,
      'Float terminal',
    },
    ['<a-v>'] = {
      function() term_util('vertical') end,
      'Vertical terminal',
    },

    ['<leader>'] = {
      name = 'Plugins and features' .. icon('', 'rocket', 1),
      b = {
        '<cmd>Neotree buffers focus float<cr>',
        'Buffers list' .. icon('', 'list-unordered', 1),
      },
      x = {
        function() require('neviraide-ui.buftabline').close_buffer() end,
        'Close buffer' .. icon('', 'trash', 1),
      },
      N = {
        '<cmd>lua require("neviraide-ui.utils.new_file")()<cr>',
        'New file' .. icon('', 'plus-circle', 1),
      },
      -- m = utils.mappings('markdown_keys'),
      G = {
        '<cmd>Neotree position=right git_status toggle<cr>',
        'GIT' .. icon('', 'mark-github', 1),
      },
      -- s = utils.mappings('settings'),
      c = utils.mappings('colorpicker'),
      t = utils.mappings('telescope_keys'),
      n = utils.mappings('todos'),
    },
  }, { mode = 'n' })

  utils.wk_reg({
    ['<c-/>'] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      'Toggle comment',
    },
    p = {
      'p:let @+=@0<CR>:let @"=@0<CR>',
      'Paste (dont copy replaced text)',
    },
  }, { mode = 'v' })

  utils.wk_reg({
    ['<a-h>'] = {
      function() term_util('horizontal') end,
      'Horizontal terminal',
    },
    ['<a-f>'] = {
      function() term_util('float') end,
      'Float terminal',
    },
    ['<a-v>'] = {
      function() term_util('vertical') end,
      'Vertical terminal',
    },
    ['<C-j>'] = { '<Cmd>wincmd j<CR>', 'Window down' },
    ['<C-k>'] = { '<Cmd>wincmd k<CR>', 'Window up' },
    ['<C-h>'] = { '<Cmd>wincmd h<CR>', 'Window left' },
    ['<C-l>'] = { '<Cmd>wincmd l<CR>', 'Window right' },
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

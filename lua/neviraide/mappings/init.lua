-- TODO: change all icons
local utils = require('neviraide.utils')
local term_util = require('neviraide.utils.terminal')

return function()
  utils.wk_reg({
    d = {
      n = {
        function() require('notify').dismiss({ silent = true, pending = true }) end,
        'Dismiss all Notifications',
      },
    },
    ['p'] = {
      'p:let @+=@0<CR>:let @"=@0<CR>',
      'Paste (dont copy replaced text)',
    },
    ['<ScrollWheelUp>'] = { 'k', 'Scroll up by one line' },
    ['<ScrollWheelDown>'] = { 'j', 'Scroll down by one line' },
    ['<Esc>'] = { ':noh <CR>', 'Clear highlights' },
    ['<c-s>'] = {
      function()
        vim.cmd('silent! wa')
        vim.notify(
          'File "' .. vim.fn.expand('%:t') .. '" was saved',
          2,
          { title = 'Saved', icon = '✓' }
        )
      end,
      'Save file ',
    },
    ['<c-n>'] = { ':Neotree reveal toggle<cr>', 'File explorer ' },
    ['<a-s>'] = {
      ':Neotree document_symbols position=right toggle<cr>',
      'Document symbols',
    },
    ['<c-/>'] = {
      function() require('Comment.api').toggle.linewise.current() end,
      'Toggle comment',
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
      function() term_util.term_toggle('horizontal') end,
      'Horizontal terminal',
    },
    ['<a-f>'] = {
      function() term_util.term_toggle('float') end,
      'Float terminal',
    },
    ['<a-v>'] = {
      function() term_util.term_toggle('vertical') end,
      'Vertical terminal',
    },

    ['<leader>'] = {
      name = 'Plugins and features ',
      b = { '<cmd>Neotree buffers focus float<cr>', 'Buffers list ' },
      x = {
        function() require('neviraide-ui.buftabline').close_buffer() end,
        'Close buffer ',
      },
      N = {
        '<cmd>lua require("neviraide.utils.new_file")()<cr>',
        'New file ',
      },
      -- m = utils.mappings('markdown_keys'),
      G = { '<cmd>Neotree position=right git_status toggle<cr>', 'GIT ' },
      s = utils.mappings('settings'),
      c = utils.mappings('colorpicker'),
      t = utils.mappings('telescope_keys'),
      n = utils.mappings('todos'),
    },
  }, { mode = 'n' })

  -- FIX: not working in which-key
  -- utils.wk_reg({
  --   -- execute cmdmode command and stay cmdline open
  --   ['<S-Enter>'] = {
  --     function() require('noice').redirect(vim.fn.getcmdline()) end,
  --     'Redirect Cmdline',
  --   },
  -- }, { mode = 'c' })

  utils.wk_reg({
    ['<c-/>'] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      'Toggle comment',
    },
    ['<leader>'] = {
      name = 'Plugins and features ',
    },
  }, { mode = 'v' })

  utils.wk_reg({
    ['<a-h>'] = {
      function() term_util.term_toggle('horizontal') end,
      'Horizontal terminal',
    },
    ['<a-f>'] = {
      function() term_util.term_toggle('float') end,
      'Float terminal',
    },
    ['<a-v>'] = {
      function() term_util.term_toggle('vertical') end,
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

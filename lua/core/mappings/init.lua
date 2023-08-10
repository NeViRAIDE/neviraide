local utils = require('core.utils')

vim.keymap.set({ 'n', 'i', 's' }, '<c-j>', function()
  if not require('noice.lsp').scroll(4) then return ':wincmd j<cr>' end
end, {
  silent = true,
  expr = true,
  desc = 'Move to top window/Scroll top LSP documentation',
})

vim.keymap.set({ 'n', 'i', 's' }, '<c-k>', function()
  if not require('noice.lsp').scroll(-4) then return ':wincmd k<cr>' end
end, {
  silent = true,
  expr = true,
  desc = 'Move to bottom window/Scroll down LSP documentation',
})

-- execute cmdmode command and stay cmdline open
vim.keymap.set(
  'c',
  '<S-Enter>',
  function() require('noice').redirect(vim.fn.getcmdline()) end,
  { desc = 'Redirect Cmdline' }
)

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
    ['<c-s>'] = {
      '<cmd>lua require("core.utils").save_and_format()<cr>',
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
    ['<tab>'] = { ':bnext<cr>', 'Next buffer' },
    ['<s-tab>'] = { ':bprev<cr>', 'Previous buffer' },
    ['<C-h>'] = { '<C-w>h', 'Window left' },
    ['<C-l>'] = { '<C-w>l', 'Window right' },
    ['<a-h>'] = {
      ':ToggleTerm direction=horizontal<cr>',
      'Horizontal terminal',
    },
    ['<a-f>'] = { ':ToggleTerm direction=float<cr>', 'Float terminal' },
    ['<a-v>'] = { ':ToggleTerm direction=vertical<cr>', 'Vertical terminal' },
    ['<a-t>'] = { ':ToggleTerm direction=tab<cr>', 'Tab terminal' },

    ['<leader>'] = {
      name = 'Plugins and features ',
      b = { '<cmd>Neotree buffers focus float<cr>', 'Buffers list ' },
      x = {
        '<cmd>lua require("core.utils").close_buffer()<cr>',
        'Delete buffer ',
      },
      N = { '<cmd>lua require("core.utils.new_file")()<cr>', 'New file ' },
      G = { '<cmd>Neotree position=right git_status toggle<cr>', 'GIT ' },
      s = utils.mappings('settings'),
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
    ['<leader>'] = {
      name = 'Plugins and features ',
    },
  }, { mode = 'v' })

  utils.wk_reg({
    ['<a-h>'] = {
      '<ESC><cmd>ToggleTerm direction=horizontal<cr>',
      'Horizontal terminal',
    },
    ['<a-f>'] = { '<ESC><cmd>ToggleTerm direction=float<cr>', 'Float terminal' },
    ['<a-v>'] = {
      '<ESC><cmd>ToggleTerm direction=vertical<cr>',
      'Vertical terminal',
    },
    ['<a-t>'] = { '<ESC><cmd>ToggleTerm direction=tab<cr>', 'Tab terminal' },
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

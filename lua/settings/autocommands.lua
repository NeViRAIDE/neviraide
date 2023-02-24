autocmd_multi('NEVIRAIDE_CONF', {
  {
    'BufReadPost',
    {
      pattern = '*',
      desc = 'Set previous cursor position when file is open',
      callback = function()
        if
          vim.fn.line('\'"') > 0 and vim.fn.line('\'"') <= vim.fn.line('$')
        then
          vim.fn.setpos('.', vim.fn.getpos('\'"'))
          vim.api.nvim_feedkeys('zz', 'n', true)
          vim.api.nvim_feedkeys('zx', 'n', true)
        end
      end,
    },
  },
  {
    'FileType',
    {
      pattern = {
        'lua',
        'vue',
        'javascript',
        'json',
        'htmldjango',
        'html',
        'css',
      },
      desc = 'Set up indent size',
      callback = function()
        vim.o.softtabstop = 2
        vim.o.tabstop = 2
        vim.o.shiftwidth = 2
      end,
    },
  },
  {
    'FileType',
    {
      pattern = { 'go', 'python', 'sh' },
      desc = 'Set up indent size',
      callback = function()
        vim.o.softtabstop = 4
        vim.o.tabstop = 4
        vim.o.shiftwidth = 4
      end,
    },
  },
  {
    'FileType',
    {
      pattern = {
        'qf',
        'checkhealth',
        'help',
        'man',
        'notify',
        'prompt',
        'lspinfo',
        'spectre_panel',
        'startuptime',
        'tsplayground',
        'PlenaryTestPopup',
      },
      desc = 'Use q to close the window',
      command = 'nnoremap <buffer> q <cmd>quit<cr>',
    },
  },
  {
    'TextYankPost',
    {
      desc = 'Highlight on yank',
      callback = function()
        vim.highlight.on_yank({ higroup = 'Search', timeout = 200 })
      end,
    },
  },
})

autocmd_multi('NEVIRAIDE_KEYS', {
  {
    'TermOpen',
    {
      pattern = 'term://*',
      desc = 'Add keymaps to go out from terminal',
      callback = function()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        -- vim.keymap.set('t', '<esc>', [[<c-\><c-n>]], opts)
        vim.o.number = false
        vim.o.relativenumber = false
      end,
    },
  },
})

autocmd_multi('NEVIRAIDE_CURSOR', {
  {
    { 'BufEnter', 'WinEnter' },
    {
      desc = 'Set cursorline if focused',
      callback = function()
        local ok, cl = pcall(vim.api.nvim_win_get_var, 0, 'auto-cursorline')
        if ok and cl then
          vim.wo.cursorline = true
          vim.api.nvim_win_del_var(0, 'auto-cursorline')
        end
      end,
    },
  },
  {
    { 'BufLeave', 'WinLeave' },
    {
      desc = 'Hide cursorline if unfocused',
      callback = function()
        local cl = vim.wo.cursorline
        if cl then
          vim.api.nvim_win_set_var(0, 'auto-cursorline', cl)
          vim.wo.cursorline = false
        end
      end,
    },
  },
  {
    'FileType',
    {
      pattern = '*',
      desc = "Don't add the comment prefix when I hit enter or o/O on a comment line.",
      callback = function() vim.o.formatoptions = 'jcrql' end,
    },
  },
})
autocmd('NEVIRIDE_CODELENS', { 'CursorHold', 'CursorHoldI', 'InsertLeave' }, {
  pattern = { '*.go', '*.mod' },
  callback = function() vim.lsp.codelens.refresh() end,
})

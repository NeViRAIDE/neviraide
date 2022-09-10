autocmd('PACKER_RELOAD', 'BufWritePost', {
  pattern = 'lua/plugins.lua',
  callback = function(args)
    vim.api.nvim_command('source ' .. args.file)
    vim.api.nvim_command('PackerUpdate')
    vim.api.nvim_command('PackerCompile')
  end,
  desc = 'Auto compile plugins',
})

autocmd_multi('NEVIRAIDE_CONF', {
  {
    'FileType',
    {
      pattern = { 'lua', 'javascript', 'html', 'css' },
      desc = 'Decrease indent size',
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
      pattern = { 'help', 'man' },
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
  {
    'WinEnter',
    {
      pattern = '*',
      desc = 'Equals width of unfocused splits',
      callback = function() vim.cmd('wincmd =') end,
    },
  },
})
autocmd_multi('NEVIRAIDE_KEYS', {
  {
    'FileType',
    {
      pattern = 'python',
      desc = 'Add python features',
      callback = function() require('config.which_key').attach_python(0) end,
    },
  },
  {
    'FileType',
    {
      pattern = 'markdown',
      desc = 'Add markdown features',
      callback = function() require('config.which_key').attach_markdown(0) end,
    },
  },
})

autocmd('FormatOnSave', 'BufWritePre', {
  desc = 'Autoformat on save',
  callback = function() vim.lsp.buf.format() end,
})

autocmd('ToggleTerm_keys', 'TermOpen', {
  pattern = 'term://*toggleterm#*',
  desc = 'Add keymaps to go out from terminal',
  callback = function()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  end,
})

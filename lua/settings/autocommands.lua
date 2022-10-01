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
      pattern = { 'lua', 'javascript', 'json', 'htmldjango', 'html', 'css' },
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
  {
    'TermOpen',
    {
      pattern = 'term://*toggleterm#*',
      desc = 'Add keymaps to go out from terminal',
      callback = function()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      end,
    },
  },
})

autocmd('Auto_SAVE/FORMAT', {
  'BufWritePre', --[[ 'FocusLost' ]]
}, {
  pattern = '*',
  callback = function()
    vim.lsp.buf.format()
    vim.cmd('silent! wa')
  end,
})

-- TODO: rewrite with util
-- vim.api.nvim_create_autocmd({ 'TextChangedI', 'TextChangedP' }, {
--   callback = function()
--     local line = vim.api.nvim_get_current_line()
--     local cursor = vim.api.nvim_win_get_cursor(0)[2]
--
--     local current = string.sub(line, cursor, cursor + 1)
--     if current == '.' or current == ',' or current == ' ' then
--       require('cmp').close()
--     end
--
--     local before_line = string.sub(line, 1, cursor + 1)
--     local after_line = string.sub(line, cursor + 1, -1)
--     if not string.match(before_line, '^%s+$') then
--       if
--         after_line == ''
--         or string.match(before_line, ' $')
--         or string.match(before_line, '%.$')
--       then
--         require('cmp').complete()
--       end
--     end
--   end,
--   pattern = '*',
-- })

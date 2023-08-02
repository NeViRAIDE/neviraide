local utils = require('core.utils')

-- Run gofmt + goimport on save
utils.autocmd_multi('GoLangNvim', {
  -- { "BufWritePre",
  --   {
  --     pattern = "*.go",
  --     callback = function()
  --       require('go.format').goimport()
  --     end,
  --   }
  -- },

  -- {
  --   { "CursorHold" },
  --   {
  --     pattern = "*.go",
  --     callback = function()
  --       vim.fn.execute('GoToggleInlay')
  --     end,
  --   }
  -- },
  {
    'FileType',
    {
      pattern = 'go',
      callback = function() utils.mappings('golang')() end,
    },
  },
})

utils.autocmd_multi('NEVIRAIDE_CONF', {
  {
    'FileType',
    {
      pattern = 'qf',
      callback = function()
        vim.opt_local.buflisted = false -- dont list quickfix buffers
      end,
    },
  },
  {
    'BufReadPost',
    {
      pattern = '*',
      desc = 'Set previous cursor position when file is open',
      callback = function()
        local exclude = { 'gitcommit' }
        local buf = vim.api.nvim_get_current_buf()
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) then return end
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
          pcall(vim.api.nvim_win_set_cursor, 0, mark)
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
        'typescript',
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
        'guihua',
      },
      desc = 'Use q to close the window',
      callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set(
          'n',
          'q',
          '<cmd>close<cr>',
          { buffer = event.buf, silent = true }
        )
      end,
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

utils.autocmd_multi('NEVIRAIDE_CURSOR', {
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

utils.autocmd('NEVIRAIDE_CODELENS', { 'InsertLeave', 'BufWritePost' }, {
  pattern = { '*.go', '*.mod', '*.vue', '*.js', '*.ts', '*.lua' },
  callback = function() vim.lsp.codelens.refresh() end,
})

-- auto open float window on diagnostic line
utils.autocmd('NEVIRAIDE_auto_diag', 'LspAttach', {
  callback = function(args)
    -- the buffer where the lsp attached
    ---@type number
    local buffer = args.buf
    -- create the autocmd to show diagnostics
    utils.autocmd('NEVIRAIDE_auto_diag', 'CursorHold', {
      group = vim.api.nvim_create_augroup('_auto_diag', { clear = true }),
      buffer = buffer,
      callback = function()
        vim.diagnostic.open_float(nil, {
          focusable = false,
          close_events = {
            'BufLeave',
            'CursorMoved',
            'InsertEnter',
            'FocusLost',
          },
          border = 'none',
          source = 'always',
          prefix = ' ',
          scope = 'cursor',
        })
      end,
    })
  end,
})

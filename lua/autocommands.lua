local autocmd = vim.api.nvim_create_autocmd
local autocmd_multi = require("utils").autocmd_multi

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- Run gofmt + goimport on save
autocmd_multi("GoLangNvim", {
  { "BufWritePre",
    {
      pattern = "*.go",
      callback = function()
        require('go.format').goimport()
      end,
    }
  },
  { "FileType",
    {
      pattern = "go",
      callback = function()
        require("mappings.go").attach_go()
      end,
    }
  }
})

autocmd_multi('NEVIRAIDE_CONF', {
  { 'BufReadPost',
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
  { 'FileType',
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
  { 'FileType',
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

local utils = require('neviraide.utils')

utils.autocmd('Edit_folder', 'BufEnter', {
  pattern = '*',
  desc = 'Open Neotree when trying to edit directories.',
  callback = function()
    local path = vim.fn.expand('%')
    if vim.fn.isdirectory(path) == 1 then vim.cmd('Neotree current') end
  end,
})

utils.autocmd('NEVIRAIDE_Markdown', 'FileType', {
  pattern = 'markdown',
  desc = 'Add markdown features',
  callback = function() require('plugins.which-key.mappings.md')() end,
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
        'toml',
        'yaml',
        'lua',
        'vue',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'json',
        'htmldjango',
        'html',
        'css',
        'scss',
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
      pattern = { 'go', 'python', 'sh', 'rust' },
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
        'neotest-summary',
        'neotest-output',
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

local function augroup(name)
  return vim.api.nvim_create_augroup('lazyvim_' .. name, { clear = true })
end

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('FileType', {
  group = augroup('wrap_spell'),
  pattern = { 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ 'FileType' }, {
  group = augroup('json_conceal'),
  pattern = { 'json', 'jsonc', 'json5' },
  callback = function() vim.opt_local.conceallevel = 0 end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = augroup('auto_create_dir'),
  callback = function(event)
    if event.match:match('^%w%w+://') then return end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})

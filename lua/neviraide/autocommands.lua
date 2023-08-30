local utils = require('neviraide.utils')

utils.autocmd('ReloadNeviraide', 'BufWritePost', {
  pattern = vim.tbl_map(
    function(path) return vim.fs.normalize(vim.loop.fs_realpath(path)) end,
    vim.fn.glob(vim.fn.stdpath('config') .. '/lua/**/*.lua', true, true, true)
  ),

  callback = function(opts)
    local fp = vim.fn.fnamemodify(
      vim.fs.normalize(vim.api.nvim_buf_get_name(opts.buf)),
      ':r'
    ) --[[@as string]]
    local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or 'nvim'
    local module =
      string.gsub(fp, '^.*/' .. app_name .. '/lua/', ''):gsub('/', '.')

    require('plenary.reload').reload_module('neviraide-ui')
    require('plenary.reload').reload_module(module)
    require('plenary.reload').reload_module('NEVIRAIDE')

    local config = NEVIRAIDE()

    vim.g.neviraide_theme = config.theme
    vim.g.transparency = config.transparency
    vim.g.borders = config.border

    -- statusline
    require('plenary.reload').reload_module('neviraide-ui.statusline')
    vim.opt.statusline = "%!v:lua.require('nvchad.statusline').run()"

    -- tabufline
    require('plenary.reload').reload_module('neviraide-ui.buftabline.modules')
    vim.opt.tabline = "%!v:lua.require('neviraide-ui.buftabline.modules')()"

    require('neviraide-ui').load_all_highlights()
    -- vim.cmd("redraw!")
    vim.notify('Config reloaded...')
  end,
})

utils.autocmd_multi('GoLangNvim', {
  {
    'FileType',
    {
      pattern = 'go',
      callback = function() utils.mappings('golang')() end,
    },
  },
})

utils.autocmd('NEVIRAIDE_Markdown', 'FileType', {
  pattern = 'markdown',
  desc = 'Add markdown features',
  callback = function() utils.mappings('markdown_keys')() end,
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

utils.autocmd('NEVIRAIDE_transparency', 'ColorScheme', {
  pattern = '*',
  callback = function()
    local transparency = NEVIRAIDE().transparency
    if transparency then vim.fn.execute('TransparentEnable') end
  end,
})

require('neviraide.lsp.autocommands')

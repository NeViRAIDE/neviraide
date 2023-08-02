local utils = require('core.utils.lualine.utils')

return {
  indent = {
    function() return '%=' end,
    cond = require('core.utils.lualine.utils').conditions.hide_in_width,
  },

  vim_mode = {
    function()
      local mode_icons = {
        n = '',
        i = '',
        c = '',
        v = ' ',
        V = ' ' .. '-Line',
        [''] = ' ' .. '-Block',
        R = '',
        t = '',
        s = '󰒅',
      }
      return mode_icons[vim.fn.mode()]
    end,
    color = function()
      local mode_color = {
        n = '#98be65',
        i = '#51afef',
        v = '#c678dd',
        [''] = '#c678dd',
        V = '#c678dd',
        c = '#ecbe7b',
        R = '#ec5f67',
        t = 'DarkYellow',
        s = '#ff8800',
      }
      return {
        fg = mode_color[vim.fn.mode()],
        gui = 'bold',
      }
    end,
    padding = { left = 1, right = 1 },
  },

  interpreter = {
    utils.interpreter,
    color = 'Comment',
    padding = { right = 1, left = 1 },
    cond = utils.conditions.hide_in_width,
  },

  lsp_server = {
    utils.lsp_source,
    icon = ' ',
    color = 'Comment',
    on_click = function() vim.fn.execute('LspInfo') end,
    cond = utils.conditions.hide_in_width,
  },

  lsp_diagnostic = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = {
      error = ' ',
      warn = ' ',
      info = ' ',
      hint = '󰌵 ',
    },
    on_click = function() vim.fn.execute('Telescope diagnostics') end,
    always_visible = true,
    cond = utils.conditions.buffer_not_empty,
  },

  diff = {
    'diff',
    source = utils.diff_source,
    symbols = {
      added = ' ',
      modified = ' ',
      removed = ' ',
    },
    on_click = function() vim.fn.execute('Gitsigns diffthis') end,
  },

  git_branch = {
    utils.branch_source,
    icon = '',
    color = { fg = '#ff8800', gui = 'bold' },
    on_click = function()
      vim.fn.execute('Neotree position=right git_status toggle')
    end,
    padding = { left = 1, right = 1 },
  },

  location = {
    function()
      local lines = vim.api.nvim_buf_line_count(0)
      local r, c = unpack(vim.api.nvim_win_get_cursor(0))
      return ' ' .. c .. ':' .. r .. '/' .. lines
    end,
    cond = utils.conditions.buffer_not_empty,
    color = { gui = 'italic' },
    padding = { left = 1, right = 1 },
  },

  buffers = {
    'buffers',
    mode = 0,
    filetype_names = {
      TelescopePrompt = ' Telescope',
      lazy = '󰒲 Lazy',
      mason = 'Mason',
      lspinfo = ' LSP Info',
      noice = ' NoICE',
      nui = 'NUI',
      nui_themes = ' Colorschemes',
      nui_new = ' Create file',
      nui_sm = 'Session Manager',
      ['neo-tree'] = '󰙅 NeoTree',
    },
    buffers_color = {
      active = 'IncSearch',
      inactive = 'Comment',
    },
    symbols = {
      modified = '  ',
      alternate_file = '',
      directory = ' ',
    },
  },

  filesize = {
    'filesize',
    color = 'Comment',
  },

  format = {
    'fileformat',
    icons_enabled = true,
    cond = utils.conditions.hide_in_width or utils.conditions.buffer_not_empty,
    color = 'Comment',
    symbols = {
      unix = 'LF ',
      dos = 'CRLF ',
      mac = 'CR ',
    },
    padding = { left = 1, right = 1 },
  },

  encoding = {
    'o:encoding',
    fmt = string.upper,
    icons_enabled = true,
    cond = utils.conditions.hide_in_width or utils.conditions.buffer_not_empty,
    color = 'Comment',
    padding = { left = 1, right = 1 },
  },

  spaces = {
    function() return vim.o.tabstop .. ' spaces' end,
    cond = utils.conditions.hide_in_width or utils.conditions.buffer_not_empty,
    color = 'Comment',
    padding = { left = 1, right = 1 },
  },

  lazy = {
    require('lazy.status').updates,
    cond = require('lazy.status').has_updates,
    on_click = function() vim.fn.execute('Lazy update') end,
    color = { fg = '#ff9e64' },
  },

  time = {
    'datetime',
    style = 'default',
    color = 'Comment',
  },

  file_path = {
    utils.get_file_path,
    cond = utils.conditions.hide_in_width or utils.conditions.buffer_not_empty,
    padding = { left = 1, right = 0 },
    on_click = function() vim.fn.execute('Neotree reveal toggle') end,
  },

  file_icon = {
    'filetype',
    icon_only = true,
    cond = utils.conditions.buffer_not_empty,
    padding = { left = 0, right = 0 },
  },

  file_name = {
    utils.custom_fname,
    newfile_status = true,
    cond = utils.conditions.buffer_not_empty,
    padding = { left = 1, right = 0 },
    on_click = function() vim.fn.execute('Neotree buffers focus float') end,
  },

  indent_with_triange = {
    function() return ' ▶' end,
    cond = utils.conditions.is_navic_location,
    color = 'BreadcrumbSep',
    padding = { left = 0, right = 0 },
  },

  navic_location = {
    function() return require('nvim-navic').get_location() end,
    cond = utils.conditions.is_navic_available,
  },

  theme = {
    function() return '' end,
    on_click = function()
      vim.fn.execute('lua require("core.utils.change_theme")()')
    end,
    color = 'FloatTitle',
    padding = { right = 1 },
  },
}

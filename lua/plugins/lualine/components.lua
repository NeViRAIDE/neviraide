local utils = require("plugins.lualine.lualine_utils")

return {
  vim_mode = {
    function()
      local mode_icons = {
        n = "",
        i = "󰏪",
        c = "",
        v = " ",
        V = " " .. '-Line',
        [''] = " " .. '-Block',
        R = "",
        t = "",
        s = "󰒅",
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
        bg = 'none',
      }
    end,
    padding = { left = 3, right = 3 },
  },

  interpreter = {
    utils.interpreter,
    color = 'Comment'
  },

  lsp_server = {
    utils.lsp_source,
    icon = ' ',
    color = 'Comment',
    on_click = function() vim.fn.execute('LspInfo') end,
  },

  lsp_diagnostic = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = {
      error = ' ',
      warn = ' ',
      info = ' ',
      hint = ' ',
    },
    on_click = function() vim.fn.execute('Telescope diagnostics') end,
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
    padding = { right = 3 },
  },

  indent = {
    function() return '%=' end,
    cond = require('plugins.lualine.lualine_utils').conditions.hide_in_width,
  },

  location = {
    function()
      local lines = vim.api.nvim_buf_line_count(0)
      local r, c = unpack(vim.api.nvim_win_get_cursor(0))
      return ' ' .. c .. ':' .. r .. "/" .. lines
    end,
    cond = require('plugins.lualine.lualine_utils').conditions.buffer_not_empty,
    color = { gui = 'italic' },
    padding = { left = 1, right = 1 },
  },

  buffers = {
    'buffers',
    mode = 0,
    filetype_names = {
      TelescopePrompt = 'Telescope',
      lazy = 'Lazy',
      mason = 'Mason',
      lspinfo = 'LSP Info',
      ['neo-tree'] = "NeoTree"
    },
    buffers_color = {
      inactive = 'Comment',
    },
    symbols = {
      modified = ' ●',
      alternate_file = '',
      directory = '',
    },
  },

  filesize = {
    'filesize',
    color = "Comment"
  }
}

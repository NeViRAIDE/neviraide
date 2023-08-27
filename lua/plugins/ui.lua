--hhhhh
local border = require('neviraide.utils.settings.float_win')
local icon = require('neviraide-ui.icons.utils').icon

local icons = {
  'nvim-tree/nvim-web-devicons',
  version = '*',
  opts = function()
    return { override = require('neviraide-ui.icons.devicons') }
  end,
  config = function(_, opts)
    dofile(vim.g.neviraide_themes_cache .. 'devicons')
    require('nvim-web-devicons').setup(opts)
  end,
}

local notifications = {
  'rcarriga/nvim-notify',
  version = '*',
  opts = function()
    dofile(vim.g.neviraide_themes_cache .. 'notify')
    return {
      on_open = function(win, record)
        if vim.api.nvim_win_is_valid(win) then
          vim.api.nvim_win_set_config(win, {
            title = {
              {
                ' ' .. record.icon .. ' ' .. record.title[1] .. ' ',
                'Notify' .. record.level .. 'Title',
              },
            },
            title_pos = 'center',
            border = require('neviraide.utils').border(),
          })
        end
      end,
      render = function(bufnr, notif, highlights)
        local renderbase = require('notify.render.base')
        local namespace = renderbase.namespace()
        local length = string.len(notif.icon)

        notif.message[1] = string.format(' %s ', notif.message[1])
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, notif.message)

        vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, length, {
          hl_group = highlights.body,
          end_line = #notif.message,
          priority = 50,
        })
      end,
      timeout = 3000,
      fps = 60,
      icons = {
        ERROR = icon('x-circle') .. ' ',
        WARN = icon('alert') .. ' ',
        INFO = icon('info') .. ' ',
        DEBUG = icon('bug') .. ' ',
        TRACE = icon('play') .. ' ',
      },
      minimum_width = 10,
      max_height = function() return math.floor(vim.o.lines * 0.75) end,
      max_width = function() return math.floor(vim.o.columns * 0.75) end,
    }
  end,
  init = function()
    local utils = require('neviraide.utils')
    if not utils.has('noice.nvim') then
      utils.on_very_lazy(function() vim.notify = require('notify') end)
    end
  end,
}

local indents = {
  'lukas-reineke/indent-blankline.nvim',
  version = '*',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    space_char_blankline = ' ',
    char_highlight_list = {
      'IndentBlanklineIndent1',
      'IndentBlanklineIndent2',
      'IndentBlanklineIndent3',
      'IndentBlanklineIndent4',
      'IndentBlanklineIndent5',
      'IndentBlanklineIndent6',
    },
    indentLine_enabled = 1,
    filetype_exclude = {
      'help',
      'terminal',
      'lazy',
      'lspinfo',
      'TelescopePrompt',
      'TelescopeResults',
      'mason',
      'noice',
    },
    buftype_exclude = { 'terminal', 'nofile' },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    show_current_context = true,
    show_current_context_start = true,
  },
  config = function(_, opts)
    dofile(vim.g.neviraide_themes_cache .. 'blankline')
    require('indent_blankline').setup(opts)
  end,
}

local nui = {
  'MunifTanjim/nui.nvim',
  version = '*',
  config = function()
    require('neviraide.override_vim_ui.input')
    require('neviraide.override_vim_ui.select')
  end,
}

local cmdline = {
  'folke/noice.nvim',
  version = '*',
  event = 'VeryLazy',
  opts = {
    cmdline = {
      format = {
        cmdline = { icon = icon('vim') .. ' ' },
        search_down = {
          icon = '  ' .. icon('search') .. ' ' .. icon('chevron-down') .. ' ',
        },
        search_up = {
          icon = '  ' .. icon('search') .. ' ' .. icon('chevron-up') .. ' ',
        },
        fish = {
          pattern = '^:%s*!',
          icon = icon('terminal') .. ' ',
          lang = 'fish',
        },
        highlights = {
          pattern = '^:%s*hi?g?h?l?i?g?h?t?%s+',
          icon = icon('paintbrush') .. ' ',
        },
        lua = { icon = icon('lua') .. ' ' },
        filter = false,
      },
    },
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
      signature = { enabled = false },
      hover = { enabled = false },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },
    routes = {
      {
        view = 'vsplit',
        filter = { min_width = 1000 },
      },
    },
    views = {
      cmdline_popup = border(),
      split = {
        enter = true,
      },
    },
  },
}

return {
  icons,
  -- cmdline,
  notifications,
  indents,
  nui,
}

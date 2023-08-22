-- TODO: add dynamic option for all borders

-- TODO: add dynamic util for nonicons

---@param themes table
---@return table
local function get_themes(themes)
  local colorschemes = {}
  for _, colorscheme in pairs(themes) do
    table.insert(colorschemes, colorscheme.plugin)
  end
  return colorschemes
end

local icons = {
  'nvim-tree/nvim-web-devicons',
  version = '*',
}

local statusline = {
  'nvim-lualine/lualine.nvim',
  version = '*',
  event = 'VeryLazy',
  opts = function()
    local component = require('neviraide.utils.lualine.components')
    return {
      extensions = {
        'lazy',
        'man',
        'neo-tree',
        'nvim-dap-ui',
        'quickfix',
        'symbols-outline',
        'toggleterm',
      },
      options = {
        disabled_filetypes = {
          winbar = {
            'neo-tree',
            'toggleterm',
          },
          'lspinfo',
          'mason',
          'filesystem',
          'TelescopePrompt',
          'help',
          'checkhealth',
          'neo-tree-popup',
          'nui',
          'nui_themes',
          'nui_new',
          'neviraideDashboard',
          'help',
        },
        component_separators = '',
        section_separators = '',
        theme = {
          normal = { c = { bg = 'none' } },
          inactive = { c = { bg = 'none' } },
        },
        globalstatus = true,
      },
      tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          component.buffers,
        },
        lualine_x = {
          component.lazy,
          component.time,
          component.theme,
        },
        lualine_y = {},
        lualine_z = {},
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          component.lsp_server,
          component.lsp_diagnostic,
          component.indent,
          component.vim_mode,
          component.filesize,
          component.location,
          component.format,
          component.encoding,
          component.spaces,
          component.interpreter,
        },
        lualine_x = {
          component.diff,
          component.git_branch,
        },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}

local notifications = {
  'rcarriga/nvim-notify',
  version = '*',
  opts = {
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

      -- TODO: add new line for noborders before message body
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
    minimum_width = 10,
    max_height = function() return math.floor(vim.o.lines * 0.75) end,
    max_width = function() return math.floor(vim.o.columns * 0.75) end,
  },
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
    -- NOTE: compatible indents with SKOBKI

    space_char_blankline = ' ',
    char_highlight_list = {
      'IndentBlanklineIndent1',
      'IndentBlanklineIndent2',
      'IndentBlanklineIndent3',
      'IndentBlanklineIndent4',
      'IndentBlanklineIndent5',
      'IndentBlanklineIndent6',
    },
    -- space_char_blankline = '',
    -- space_char_highlight_list = {
    --   'IndentBlanklineIndent1',
    --   'IndentBlanklineIndent2',
    --   'IndentBlanklineIndent3',
    --   'IndentBlanklineIndent4',
    --   'IndentBlanklineIndent5',
    --   'IndentBlanklineIndent6',
    -- },
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
}

local nui = {
  'MunifTanjim/nui.nvim',
  version = '*',
  config = function()
    require('neviraide.override_vim_ui.input')
    require('neviraide.override_vim_ui.select')
  end,
}

local border = require('neviraide.utils.settings.float_win')

local cmdline = {
  -- FIX: strange in go files (show not lsp server)
  'folke/noice.nvim',
  version = '*',
  event = 'VeryLazy',
  opts = {
    cmdline = {
      format = {
        cmdline = { icon = ' ' },
        search_down = { icon = '  ' },
        search_up = { icon = '  ' },
        fish = { pattern = '^:%s*!', icon = '󰈺 ', lang = 'fish' },
        highlights = { pattern = '^:%s*hi?g?h?l?i?g?h?t?%s+', icon = ' ' },
        lua = { icon = ' ' },
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
  get_themes(require('neviraide.utils.settings.change_theme.themes')),
  icons,
  -- statusline,
  cmdline,
  notifications,
  indents,
  nui,
}

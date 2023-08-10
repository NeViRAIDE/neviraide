return {
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    opts = function()
      local version = require('core.utils').nvim_version
      local alpha_utils = require('core.utils.alpha')
      return {
        layout = {
          alpha_utils.header,
          { type = 'padding', val = 3 },
          {
            type = 'group',
            val = {
              alpha_utils.button(
                '',
                ' Create new file',
                ':lua require("core.utils.new_file")()<cr>'
              ),
              alpha_utils.button(
                '',
                ' Find file',
                ':Telescope find_files<cr>'
              ),
              alpha_utils.button(
                '',
                ' Recent files',
                ':Telescope oldfiles<cr>'
              ),
              alpha_utils.button(
                '',
                ' Find word',
                ':Telescope live_grep<cr>'
              ),
              alpha_utils.button(
                '',
                ' TODO list',
                ':TodoTelescope theme=ivy initial_mode=normal previewer=false layout_config={bottom_pane={height=14}}<cr>'
              ),
              alpha_utils.button('', ' Check health', ':checkhealth<cr>'),
              alpha_utils.button('', ' Plugin manager', ':Lazy<cr>'),
              alpha_utils.button('', ' Exit', ':qa<cr>'),
            },
            opts = { hl = 'Constant' },
          },
          { type = 'padding', val = 1 },
          {
            type = 'text',
            val = version,
            opts = { position = 'center', hl = 'Comment' },
          },
          { type = 'padding', val = 1 },
          {
            type = 'text',
            val = require('alpha.fortune')(),
            opts = { position = 'center', hl = 'AlphaFooter' },
          },
        },
      }
    end,
  },

  'nvim-tree/nvim-web-devicons',

  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = function()
      local component = require('core.utils.lualine.components')
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
            'alpha',
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
        winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            component.file_path,
            component.file_icon,
            component.file_name,
            component.indent_with_triange,
            component.navic_location,
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
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
  },

  {
    'MunifTanjim/nui.nvim',
    config = function()
      require('core.override_vim_ui.input')
      require('core.override_vim_ui.select')
    end,
  },

  {
    'rcarriga/nvim-notify',
    opts = {
      -- background_colour = '#ff0000',
      timeout = 3000,
      fps = 60,
      minimum_width = 10,
      max_height = function() return math.floor(vim.o.lines * 0.75) end,
      max_width = function() return math.floor(vim.o.columns * 0.75) end,
    },
    init = function()
      local utils = require('core.utils')
      if not utils.has('noice.nvim') then
        utils.on_very_lazy(function() vim.notify = require('notify') end)
      end
    end,
  },

  {
    -- FIX: strange in go files (show not lsp server)
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      lsp = {
        signature = {
          auto_open = {
            enabled = false,
            trigger = false,
            luasnip = false,
          },
        },
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
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
        split = {
          enter = true,
        },
      },
    },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      indentLine_enabled = 1,
      filetype_exclude = {
        'help',
        'terminal',
        'lazy',
        'lspinfo',
        'TelescopePrompt',
        'TelescopeResults',
        'mason',
        'nvdash',
        'nvcheatsheet',
        'noice',
      },
      buftype_exclude = { 'terminal', 'nofile' },
      show_trailing_blankline_indent = false,
      show_first_indent_level = false,
      show_current_context = true,
      show_current_context_start = true,
    },
  },
}

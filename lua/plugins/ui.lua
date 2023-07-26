return {
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    opts  = function()
      local component = require("utils.lualine.components")
      return {
        extensions = {
          "lazy",
          'man',
          'neo-tree',
          'nvim-dap-ui',
          "quickfix",
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
          },
          component_separators = '',
          section_separators = '',
          theme = {
            normal = { c = { bg = "none" } },
            inactive = { c = { bg = "none" } },
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
            component.settings,
            component.buffers,
          },
          lualine_x = {
            component.lazy,
            component.time,
            component.exit
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
            {
              function() return '%=' end,
              cond = require('utils.lualine.utils').conditions.hide_in_width,
            },
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
    "MunifTanjim/nui.nvim",
    config = function()
      require('core.override_vim_ui.input')
      require('core.override_vim_ui.select')
    end
  },
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "dn",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all Notifications",
      },
    },
    opts = {
      timeout = 3000,
      fps = 60,
      minimum_width = 10,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    init = function()
      -- when noice is not enabled, install notify on VeryLazy
      local Util = require("core.utils")
      if not Util.has("noice.nvim") then
        Util.on_very_lazy(function()
          vim.notify = require("notify")
        end)
      end
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
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
        -- lsp_doc_border = true,
      },
      routes = {
        {
          view = 'vsplit',
          filter = { min_width = 1000 },
        },
      },
      views = {
        split = {
          enter = true
        }
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      return {
        indentLine_enabled = 1,
        filetype_exclude = {
          "help",
          "terminal",
          "lazy",
          "lspinfo",
          "TelescopePrompt",
          "TelescopeResults",
          "mason",
          "nvdash",
          "nvcheatsheet",
          "noice"
        },
        buftype_exclude = { "terminal", "nofile" },
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
        show_current_context = true,
        show_current_context_start = true,
      }
    end,
  },
}

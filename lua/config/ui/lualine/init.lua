-- TODO: return my NEVIRAIDE config
local component = require('config.ui.lualine.components')

return {
  'nvim-lualine/lualine.nvim',
  event        = "VeryLazy",
  config       = function()
    require("lualine").setup(
      {
        extensions = {
          "lazy",
          'man',
          'neo-tree',
          'nvim-dap-ui',
          'nvim-dap-ui',
          "quickfix",
          'symbols-outline',
          'toggleterm',
        },
        options = {
          disabled_filetypes = {
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
            normal = { c = { bg = 'none' } },
            inactive = { c = { bg = 'none' } },
          },
          globalstatus = true,
        },
        tabline = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            { function() return '%=' end },
            component.buffers
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {
            component.lazy
          }
        },
        sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            component.vim_mode,
            component.filesize,
            component.location,
            { function() return '%=' end, cond = require('config.ui.lualine.lualine_utils').conditions.hide_in_width },
            component.interpreter,
            component.lsp_server,
            component.lsp_diagnostic
          },
          lualine_x = {
            component.spaces,
            component.encoding,
            component.format,
            component.diff,
            component.git_branch,
          },
          lualine_y = {},
          lualine_z = {},
        },
      })
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
}

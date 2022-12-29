-- TODO: add todo-comments count
local M = {
  'nvim-lualine/lualine.nvim',
  event = 'BufReadPre',
}

function M.config()
  local lualine = require('lualine')

  local config = {
    extensions = {
      'quickfix',
      'neo-tree',
      'toggleterm',
      'nvim-dap-ui',
      'man',
    },
    disabled_filetypes = {
      'neo-tree',
      'mason',
      'filesystem',
      'TelescopePrompt',
      'help',
      'dashboard',
      'lazy',
      'Sqls_output',
    },
    options = {
      component_separators = '',
      section_separators = '',
      theme = {
        normal = { c = { fg = color.fg, bg = color.none } },
        inactive = { c = { fg = color.fg, bg = color.none } },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
    tabline = require('config.plugins.lualine.tabline'),
    winbar = require('config.plugins.lualine.winbar'),
    sections = require('config.plugins.lualine.statusline'),
    globalstatus = true,
  }

  lualine.setup(config)
end

return M

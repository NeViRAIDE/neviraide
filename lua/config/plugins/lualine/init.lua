local M = {
  'nvim-lualine/lualine.nvim',
  -- event = 'BufReadPre',
  event = 'BufWinEnter',
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
    options = {
      disabled_filetypes = {
        winbar = { 'dashboard', 'neo-tree' },
        'lspinfo',
        'mason',
        'filesystem',
        'TelescopePrompt',
        'help',
        'lazy',
        'Sqls_output',
      },
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

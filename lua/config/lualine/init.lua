local config = {
  extensions = {
    'quickfix',
    'nvim-tree',
    'toggleterm',
    'nvim-dap-ui',
    'man',
    'symbols-outline',
  },
  options = {
    refresh = {
      statusline = 200, -- Note these are in mili second and default is 1000
      tabline = 500,
      winbar = 300,
    },
    disabled_filetypes = {
      'mason',
      'NvimTree',
      'packer',
      'TelescopePrompt',
      'toggleterm',
      'lspsagaoutline',
      'terminal',
      'term',
      'help',
      'dashboard',
    },
    section_separators = '',
    component_separators = '',
    theme = {
      normal = { c = { fg = 'Grey', bg = 'none' } },
      inactive = { c = { fg = 'Grey', bg = 'none' } },
    },
  },
  tabline = require('config.lualine.tabline'),
  winbar = require('config.lualine.winbar'),
  sections = require('config.lualine.statusline'),
  globalstatus = true,
}

require('lualine').setup(config)

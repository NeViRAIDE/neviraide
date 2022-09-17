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
    disabled_filetypes = {
      'mason',
      'NvimTree',
      'dashboard',
      'packer',
      'TelescopePrompt',
      'toggleterm',
      'lspsagaoutline',
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

local middle_panel = require('config.plugins.lualine.winbar.middle')
local right_panel = require('config.plugins.lualine.winbar.right')

return {
  lualine_a = {},
  lualine_b = {},
  lualine_c = middle_panel,
  lualine_x = right_panel,
  lualine_y = {},
  lualine_z = {},
}

local component = require('plugins.config.ui.lualine.components')

local center_panel = {
  component.buffers,
}

local right_panel = {
  component.lazy,
  component.time,
}

return {
  lualine_a = {},
  lualine_b = {},
  lualine_c = center_panel,
  lualine_x = right_panel,
  lualine_y = {},
  lualine_z = {},
}

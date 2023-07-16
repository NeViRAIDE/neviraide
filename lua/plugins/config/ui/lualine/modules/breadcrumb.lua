local component = require("plugins.config.ui.lualine.components")

return {
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
}

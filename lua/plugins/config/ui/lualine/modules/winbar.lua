-- TODO: rename to tabline and realize bufferline
local component = require('plugins.config.ui.lualine.components')

local indent = {
  function()
    local half_window_width = vim.api.nvim_win_get_width(0) / 2 - 14
    return string.rep(' ', half_window_width)
  end,
  padding = { left = 0, right = 0 },
}

local center_panel = {
  component.buffers,
  indent,
  component.location,
}

local right_panel = {
  component.lazy,
  component.time,
  'datetime'
}


return {
  lualine_a = {},
  lualine_b = {},
  lualine_c = center_panel,
  lualine_x = right_panel,
  lualine_y = {},
  lualine_z = {},
}

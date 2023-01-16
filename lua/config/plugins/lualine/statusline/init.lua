local left_panel_elements = require('config.plugins.lualine.statusline.left')

--- space beetween left and middle panels
local indent = {
  function() return '%=' end,
  cond = require('utils.lualine_utils').conditions.hide_in_width,
}

local statusline = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = { indent },
  lualine_x = require('config.plugins.lualine.statusline.right'),
  lualine_y = {},
  lualine_z = {},
}

-- add left panel
for i, el in ipairs(left_panel_elements) do
  table.insert(statusline.lualine_c, i, el)
end

-- get left panel's length  + 1 (indent element)
local middle_start_idx = table.maxn(left_panel_elements) + 1

-- add middle panel
for i, el in ipairs(require('config.plugins.lualine.statusline.middle')) do
  table.insert(statusline.lualine_c, middle_start_idx + i, el)
end

return statusline

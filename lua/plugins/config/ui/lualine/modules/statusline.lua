local component = require('plugins.config.ui.lualine.components')

local left_panel_elements = {
  component.lsp_server,
  component.lsp_diagnostic,
}

local center_panel_elements = {
  component.vim_mode,
  component.filesize,
  component.location,
  component.format,
  component.encoding,
  component.spaces,
  component.interpreter,
}

local right_panel_elements = {
  component.diff,
  component.git_branch,
}


--- space beetween left and middle panels
local indent = {
  function() return '%=' end,
  cond = require('plugins.config.ui.lualine.lualine_utils').conditions.hide_in_width,
}

local statusline = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = { indent },
  lualine_x = right_panel_elements,
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
for i, el in ipairs(center_panel_elements) do
  table.insert(statusline.lualine_c, middle_start_idx + i, el)
end

return statusline

local navic = require('nvim-navic')
local utils = require('utils.lualine_utils')

local indent = {
  function() return ' ' end,
  color = { bg = color.none },
  padding = { left = 2, right = 0 },
}

local file_path = {
  -- TODO: on_click to open neo-tree with focus on selected node
  utils.get_file_path,
  cond = utils.conditions.hide_in_width or utils.conditions.buffer_not_empty,
  color = { bg = color.none },
  padding = { left = 0, right = 0 },
  on_click = function() vim.fn.execute('NeoTreeFocusToggle') end,
}

local file_icon = {
  'filetype',
  icon_only = true,
  cond = utils.conditions.buffer_not_empty,
  color = { bg = color.none },
  padding = { left = 0, right = 1 },
}

local file_name = {
  utils.custom_fname,
  newfile_status = true,
  cond = utils.conditions.buffer_not_empty,
  padding = { left = 1, right = 0 },
  on_click = function() vim.fn.execute('Telescope buffers') end,
}

local indent_with_triange = {
  function() return ' ' .. icon('triangle-right', '▶ ', '> ') end,
  cond = navic.is_available and utils.conditions.buffer_not_empty,
  color = { bg = color.none, fg = color.red },
  padding = { left = 0, right = 0 },
}

local navic_location = {
  -- TODO: on_click function to get location in code
  navic.get_location,
  color = { bg = color.none },
  cond = navic.is_available or utils.conditions.buffer_not_empty,
  padding = { left = 0, right = 0 },
}

return {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {
    indent,
    file_path,
    file_icon,
    file_name,
    indent_with_triange,
    navic_location,
  },
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}

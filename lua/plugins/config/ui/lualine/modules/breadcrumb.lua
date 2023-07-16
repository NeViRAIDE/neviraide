local navic = require('nvim-navic')
local utils = require('plugins.config.ui.lualine.lualine_utils')

local indent = {
  function() return ' ' end,
  color = { bg = "none" },
  padding = { left = 2, right = 0 },
}

-- FIX: hide in terminal
local file_path = {
  utils.get_file_path,
  cond = utils.conditions.hide_in_width or utils.conditions.buffer_not_empty,
  --color = { bg = color.none },
  color = { bg = "none" },
  padding = { left = 0, right = 0 },
  on_click = function() vim.fn.execute('Neotree reveal toggle') end,
}

local file_icon = {
  'filetype',
  icon_only = true,
  cond = utils.conditions.buffer_not_empty,
  --color = { bg = color.none },
  color = { bg = "none" },
  padding = { left = 0, right = 0 },
}

local file_name = {
  utils.custom_fname,
  newfile_status = true,
  cond = utils.conditions.buffer_not_empty,
  padding = { left = 1, right = 0 },
  color = { bg = "none" },
  on_click = function() vim.fn.execute('Neotree buffers focus float') end,
}

-- FIX: hide on neo-tree
local indent_with_triange = {
  function() return ' ▶' end,
  cond = navic.is_available and utils.conditions.buffer_not_empty,
  color = "BreadcrumbSep",
  padding = { left = 0, right = 0 },
}

local navic_location = {
  -- TODO: on_click function to get location in code
  navic.get_location,
  --color = { bg = color.none },
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
    -- navic_location,
    {
      function()
        return navic.get_location()
      end,
      cond = function()
        return navic.is_available()
      end
    },
    -- {
    --   "navic",
    --   color_correction = "static",
    --   navic_opts = nil
    -- }
  },
  lualine_x = {
    -- TODO: realize tabs
    -- {
    --   'tabs',
    --   mode = 1,
    --   tabs_color = {
    --     -- Same values as the general color option can be used here.
    --     active = 'String', -- Color for active tab.
    --     inactive = 'Comment', -- Color for inactive tab.
    --   },
    --   fmt = function(name, context)
    --     -- Show + if buffer is modified in tab
    --     local buflist = vim.fn.tabpagebuflist(context.tabnr)
    --     local winnr = vim.fn.tabpagewinnr(context.tabnr)
    --     local bufnr = buflist[winnr]
    --     local mod = vim.fn.getbufvar(bufnr, '&mod')
    --
    --     return name .. (mod == 1 and ' +' or '')
    --   end,
    -- },
  },
  lualine_y = {},
  lualine_z = {},
}

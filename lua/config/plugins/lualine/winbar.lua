local conditions = require('config.plugins.lualine.utils').conditions
local left_separator = require('config.plugins.lualine.utils').left_separator
local right_separator = require('config.plugins.lualine.utils').right_separator
local clock = require('config.plugins.lualine.utils').clock

return {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {
    {
      function()
        local half_window_width = vim.api.nvim_win_get_width(0) / 2 - 15
        return string.rep(' ', half_window_width)
      end,
      padding = { left = 0, right = 0 },
    },
    {
      left_separator,
      color = function() return { fg = color.bg, bg = color.none } end,
      padding = { left = 0, right = 0 },
    },
    {
      'location',
      icon = '',
      cond = conditions.buffer_not_empty,
      color = { bg = color.bg, gui = 'italic' },
      padding = { left = 1, right = 1 },
    },
    {
      function()
        local mode_icons = {
          n = 'Normal',
          i = 'Insert',
          c = 'Command',
          v = '-isual',
          [''] = '' .. '-Block',
          V = '' .. '-Line',
          R = 'Replace',
          t = 'Terminal ',
        }
        return mode_icons[vim.fn.mode()]
      end,
      color = function()
        local mode_color = {
          n = color.green,
          i = color.blue,
          v = color.magenta,
          [''] = color.magenta,
          V = color.magenta,
          c = color.yellow,
          R = color.red,
          t = color.darkYellow,
        }
        return {
          fg = mode_color[vim.fn.mode()],
          gui = 'bold,italic',
          bg = color.bg,
        }
      end,
      padding = { left = 1, right = 1 },
    },
    {
      'progress',
      cond = conditions.buffer_not_empty,
      color = { fg = color.fg, gui = 'bold', bg = color.bg },
      padding = { left = 1, right = 1 },
    },
    {
      right_separator,
      color = function() return { fg = color.bg, bg = color.none } end,
      padding = { left = 0, right = 0 },
    },
    { function() return '%=' end },
    {
      left_separator,
      color = function() return { fg = color.bg, bg = color.none } end,
      padding = { left = 0, right = 0 },
    },
    {
      require('lazy.status').updates,
      cond = require('lazy.status').has_updates,
      color = { fg = '#ff9e64', bg = color.bg },
    },
    {
      clock,
      color = { fg = color.fg, gui = 'bold', bg = color.bg },
    },
    {
      right_separator,
      color = function() return { fg = color.bg, bg = color.none } end,
      padding = { left = 0, right = 3 },
    },
  },
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}

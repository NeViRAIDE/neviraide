local utils = require('utils.lualine_utils')

local time = {
  utils.clock,
  color = { fg = color.fg, gui = 'bold', bg = color.bg },
}

local plugins = {
  require('lazy.status').updates,
  cond = require('lazy.status').has_updates,
  color = { fg = '#ff9e64', bg = color.bg },
  on_click = function() vim.fn.execute('Lazy update') end,
}

return {
  utils.separator('left'),
  plugins,
  utils.separator('', require('lazy.status').has_updates),
  time,
  utils.separator('right', nil, 0, 3),
}

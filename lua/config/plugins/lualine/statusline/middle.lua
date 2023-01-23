local utils = require('utils.lualine_utils')

-- size of current file
local size = {
  'filesize',
  cond = utils.conditions.buffer_not_empty,
  color = { bg = color.bg },
}

-- format of current file
local format = {
  'fileformat',
  icons_enabled = true,
  cond = utils.conditions.hide_in_width or utils.conditions.buffer_not_empty,
  color = { fg = color.fg, bg = color.bg },
  symbols = {
    unix = 'LF ',
    dos = 'CRLF ',
    mac = 'CR ',
  },
}

-- encoding of current file
local encoding = {
  'o:encoding',
  fmt = string.upper,
  icons_enabled = true,
  cond = utils.conditions.hide_in_width or utils.conditions.buffer_not_empty,
  color = { fg = color.fg, bg = color.bg },
}

-- number of spaces uses for indents
local spaces = {
  function() return vim.o.tabstop .. ' spaces' end,
  cond = utils.conditions.hide_in_width or utils.conditions.buffer_not_empty,
  color = { bg = color.bg },
}

-- filetype and version of interpreter
local interpreter = {
  utils.interpreter,
  color = { fg = color.fg, bg = color.bg, gui = 'italic' },
  cond = utils.conditions.hide_in_width or utils.conditions.buffer_not_empty,
}

-- virtual environment
local venv = {
  utils.virtual_env,
  color = { bg = color.bg, gui = 'italic' },
  cond = utils.conditions.buffer_not_empty,
  padding = { left = 0, right = 1 },
}

local hiw_and_bne = utils.conditions.hide_in_width
  or utils.conditions.buffer_not_empty

return {
  utils.separator('left', utils.conditions.hide_in_width),
  utils.separator('', function() return vim.fn.winwidth(0) < 100 end),
  size,
  utils.separator('', hiw_and_bne),
  format,
  utils.separator('', hiw_and_bne),
  encoding,
  utils.separator('', hiw_and_bne),
  spaces,
  utils.separator('', hiw_and_bne),
  interpreter,
  venv,
  utils.separator('right'),
}

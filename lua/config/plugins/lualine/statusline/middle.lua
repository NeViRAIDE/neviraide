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
  cond = utils.conditions.buffer_not_empty,
}

-- virtual environment
local venv = {
  utils.virtual_env,
  color = { bg = color.bg, gui = 'italic' },
  cond = utils.conditions.buffer_not_empty,
  padding = { left = 0, right = 1 },
}

return {
  utils.separator('left'),
  size,
  utils.separator('', utils.conditions.buffer_not_empty),
  format,
  utils.separator(
    '',
    utils.conditions.hide_in_width or utils.conditions.buffer_not_empty
  ),
  encoding,
  utils.separator(
    '',
    utils.conditions.hide_in_width or utils.conditions.buffer_not_empty
  ),
  spaces,
  utils.separator(
    '',
    utils.conditions.hide_in_width or utils.conditions.buffer_not_empty
  ),
  interpreter,
  venv,
  utils.separator('right'),
}

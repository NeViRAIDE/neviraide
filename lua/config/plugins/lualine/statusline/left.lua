local utils = require('utils.lualine_utils')

local lsp_server = {
  utils.lsp_source,
  icon = icon('server'),
  color = { bg = color.bg },
  cond = utils.conditions.hide_in_width,
  on_click = function() vim.fn.execute('LspInfo') end,
}

local lsp_diagnostic = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = {
    error = icon('x-circle'),
    warn = icon('alert'),
    info = icon('info'),
    hint = icon('light-bulb'),
  },
  diagnostics_color = {
    color_error = { fg = color.red },
    color_warn = { fg = color.yellow },
    color_info = { fg = color.blue },
    color_hint = { fg = color.magenta },
  },
  on_click = function() vim.fn.execute('Telescope diagnostics') end,
  always_visible = true,
  color = { bg = color.bg },
  cond = utils.conditions.buffer_not_empty,
}

return {
  utils.separator('left', nil, 3, 0),
  lsp_server,
  utils.separator('', utils.conditions.hide_in_width),
  lsp_diagnostic,
  utils.separator('right'),
}

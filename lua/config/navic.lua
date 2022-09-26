local navic = require('nvim-navic')

navic.setup({
  separator = ' ' .. icon('triangle-right'),
  highlight = true,
  -- depth_limit = 3,
})

vim.api.nvim_set_hl(
  0,
  'NavicIconsFile',
  { default = true, bg = color.none, fg = '#ffffff' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsModule',
  { default = true, bg = color.none, fg = '#61afef' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsNamespace',
  { default = true, bg = color.none, fg = '#ff8700' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsPackage',
  { default = true, bg = color.none, fg = '#cba6f7' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsClass',
  { default = true, bg = color.none, fg = '#cb69f7' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsMethod',
  { default = true, bg = color.none, fg = '#4e69f7' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsProperty',
  { default = true, bg = color.none, fg = '#36d0e0' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsField',
  { default = true, bg = color.none, fg = '#1abc9c' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsConstructor',
  { default = true, bg = color.none, fg = '#61afef' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsEnum',
  { default = true, bg = color.none, fg = '#ffffff' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsInterface',
  { default = true, bg = color.none, fg = '#ffffff' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsFunction',
  { default = true, bg = color.none, fg = '#ffffff' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsVariable',
  { default = true, bg = color.none, fg = '#ffffff' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsConstant',
  { default = true, bg = color.none, fg = '#ffffff' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsString',
  { default = true, bg = color.none, fg = '#98be65', bold = true }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsNumber',
  { default = true, bg = color.none, fg = '#ffffff' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsBoolean',
  { default = true, bg = color.none, fg = '#ff8700' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsArray',
  { default = true, bg = color.none, fg = '#ffffff' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsObject',
  { default = true, bg = color.none, fg = '#ff8700', bold = true }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsKey',
  { default = true, bg = color.none, fg = '#ffffff' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsNull',
  { default = true, bg = color.none, fg = '#ffffff' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsEnumMember',
  { default = true, bg = color.none, fg = '#ffffff' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsStruct',
  { default = true, bg = color.none, fg = '#ffffff' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsEvent',
  { default = true, bg = color.none, fg = '#ffffff' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsOperator',
  { default = true, bg = color.none, fg = '#ffffff' }
)
vim.api.nvim_set_hl(
  0,
  'NavicIconsTypeParameter',
  { default = true, bg = color.none, fg = '#afd700' }
)
vim.api.nvim_set_hl(0, 'NavicText', {
  default = true,
  bg = color.none,
})
vim.api.nvim_set_hl(
  0,
  'NavicSeparator',
  { default = true, bg = color.none, fg = '#d16d9e' }
)

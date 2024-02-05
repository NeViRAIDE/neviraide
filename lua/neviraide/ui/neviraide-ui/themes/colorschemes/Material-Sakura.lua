local M = {}

M.base_30 = {
  accent = '#575279',
  white = '#4c4f69',
  darker_black = '#f2e9de',
  black = '#faf4ed',
  black2 = '#ccd0da',
  one_bg = '#bcc0cc',
  one_bg2 = '#acb0be',
  one_bg3 = '#9ca0b0',
  grey = '#8c8fa1',
  grey_fg = '#7c7f93',
  grey_fg2 = '#6c6f85',
  light_grey = '#5c5f77',
  red = '#d20f39',
  baby_pink = '#ffa5c3',
  pink = '#ea76cb',
  line = '#383747',
  green = '#40a02b',
  vibrant_green = '#b6f4be',
  nord_blue = '#8bc2f0',
  blue = '#1e66f5',
  yellow = '#ea9d34',
  sun = '#ffe9b6',
  purple = '#d0a9e5',
  dark_purple = '#907aa9',
  teal = '#56949f',
  orange = '#d7827e',
  cyan = '#04a5e5',
  statusline_bg = '#232232',
  lightbg = '#2f2e3e',
  pmenu_bg = '#ABE9B3',
  folder_bg = '#89B4FA',
  lavender = '#7287fd',
}

M.base_16 = {
  base00 = '#faf4ed',
  base01 = '#fffaf3',
  base02 = '#f2e9de',
  base03 = '#e4dfde',
  bace04 = '#ddd2d2',
  base05 = '#9893a5',
  base06 = '#6e6a86',
  base07 = '#575279',
  base08 = '#b4637a',
  base09 = '#d7827e',
  base0A = '#ea9d34',
  base0B = '#286983',
  base0C = '#56949f',
  base0D = '#1e66f5',
  base0E = '#907aa9',
  base0F = '#d20f39',
}

M.polish_hl = {
  treesitter = {
    ['@variable'] = { fg = M.base_30.lavender },
    ['@property'] = { fg = M.base_30.teal },
    ['@variable.builtin'] = { fg = M.base_30.red },
  },
}

M.type = 'light'

return M

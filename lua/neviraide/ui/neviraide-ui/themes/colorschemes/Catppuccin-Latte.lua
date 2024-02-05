local M = {}

M.base_30 = {
  white = '#4c4f69',
  darker_black = '#dce0e8',
  black = '#eff1f5',
  black2 = '#ccd0da',
  accent = '#8839EF',
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
  yellow = '#df8e1d',
  sun = '#ffe9b6',
  purple = '#d0a9e5',
  dark_purple = '#8839ef',
  teal = '#179299',
  orange = '#fe640b',
  cyan = '#04a5e5',
  statusline_bg = '#232232',
  lightbg = '#2f2e3e',
  pmenu_bg = '#ABE9B3',
  folder_bg = '#89B4FA',
  lavender = '#7287fd',
}

M.base_16 = {
  base00 = '#eff1f5',
  base01 = '#ccd0da',
  base02 = '#bcc0cc',
  bace03 = '#acb0be',
  base04 = '#9ca0b0',
  base05 = '#8c8fa1',
  base06 = '#7c7f93',
  base07 = '#6c6f85',
  base08 = '#e64553',
  base09 = '#fe640b',
  base0A = '#df8e1d',
  base0B = '#40a02b',
  base0C = '#209fb5',
  base0D = '#1e66f5',
  base0E = '#8839ef',
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

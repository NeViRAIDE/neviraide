local M = {}

M.base_30 = {
  accent = '#FADA16',
  white = '#D8DEE9',
  darker_black = '#1a1a1a',
  black = '#000000', --  nvim bg
  black2 = '#202020',
  one_bg = '#242424',
  one_bg2 = '#2e2e2e',
  one_bg3 = '#383838',
  grey = '#424242',
  grey_fg = '#4c4c4c',
  grey_fg2 = '#606060',
  light_grey = '#677777',
  red = '#D62246',
  baby_pink = '#eca8a8',
  pink = '#da838b',
  line = '#FDF500', -- for lines like vertsplit
  green = '#4DBD4F',
  vibrant_green = '#1F5322',
  blue = '#F29C6B',
  nord_blue = '#FFA6C2',
  yellow = '#FDF500',
  sun = '#eff6ab',
  purple = '#A56DF2',
  dark_purple = '#564873',
  teal = '#37EBF3',
  orange = '#efb6a0',
  cyan = '#2CF6B3',
  statusline_bg = '#1e1e1e',
  lightbg = '#2e2e2e',
  pmenu_bg = '#FDF500',
  folder_bg = '#7797b7',
}

M.base_16 = {
  base00 = '#000000',
  base01 = '#1f1f1f',
  base02 = '#2e2e2e',
  base03 = '#383838',
  base04 = '#da838b',
  base05 = '#bfc5d0',
  base06 = '#c7cdd8',
  base07 = '#ced4df',
  base08 = '#eee8d5',
  base09 = '#efb6a0',
  base0A = '#FDF500',
  base0B = '#4DBD4F',
  base0C = '#FFA6C2',
  base0D = '#F29C6B',
  base0E = '#A56DF2',
  base0F = '#D62246',
}

M.polish_hl = {
  treesitter = {
    ['@punctuation.bracket'] = { fg = M.base_30.red },
  },
}

M.type = 'dark'

return M

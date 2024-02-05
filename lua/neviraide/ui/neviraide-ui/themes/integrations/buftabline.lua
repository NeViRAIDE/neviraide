local colors =
  require('neviraide.ui.neviraide-ui.themes').get_theme_tb('base_30')
local accent = require('neviraide.ui.neviraide-ui.hyprland.utils').wb_colors

local highlights = {
  TblineFill = { bg = accent.main_bg },
  BufTabDate = { fg = colors.grey_fg, bg = accent.main_bg, italic = true },
  TbLineBufOn = { fg = colors.white, bg = colors.black, bold = true },
  TbLineBufOff = { fg = colors.light_grey, bg = accent.main_bg },
  TbLineBufOnModified = { fg = colors.green, bg = colors.black, italic = true },
  TbLineBufOffModified = { fg = colors.red, bg = accent.main_bg, italic = true },
  TbLineBufOnClose = { fg = colors.red, bg = colors.black },
  TbLineBufOffClose = { fg = colors.light_grey, bg = accent.main_bg },
  TblineTabNewBtn = { fg = colors.white, bg = colors.one_bg3, bold = true },
  TbLineTabOn = { fg = colors.black, bg = colors.nord_blue, bold = true },
  TbLineTabOff = { fg = colors.white, bg = colors.one_bg2 },
  TbLineTabCloseBtn = { fg = colors.black, bg = colors.nord_blue },
  TBTabTitle = { fg = colors.black, bg = colors.white },
  TbLineThemeToggleBtn = { bold = true, fg = colors.white, bg = colors.one_bg3 },
  TbLineCloseAllBufsBtn = { bold = true, bg = colors.red, fg = colors.black },
}

local hlgroups_glassy = {
  'BufTabDate',
  'TblineFill',
  'TbLineBufOn',
  'TbLineBufOff',
  'TbLineBufOnClose',
  'TbLineBufOffClose',
  'TbLineBufOnModified',
  'TbLineBufOffModified',
}

if vim.g.transparency then
  for _, val in ipairs(hlgroups_glassy) do
    highlights[val].bg = 'NONE'
  end
end

return highlights

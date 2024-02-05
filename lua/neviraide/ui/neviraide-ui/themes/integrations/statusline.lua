local colors =
  require('neviraide.ui.neviraide-ui.themes').get_theme_tb('base_30')
local merge_tb = vim.tbl_deep_extend

local statusline_theme = 'default'

local statusline_bg = colors.statusline_bg
local light_grey = colors.light_grey

if NEVIRAIDE().transparency then statusline_bg = 'NONE' end

local Lsp_highlights = {
  St_lspError = { fg = colors.red, bg = 'none' },
  St_lspWarning = { fg = colors.yellow, bg = 'none' },
  St_LspHints = { fg = colors.purple, bg = 'none' },
  St_LspInfo = { fg = colors.green, bg = 'none' },
}

local M = {}

M.default = {
  StatusLine = { bg = statusline_bg },
  St_gitIcons = { fg = light_grey, bg = statusline_bg, bold = true },
  St_LspStatus = { fg = colors.grey_fg, bg = 'none' },
  St_LspProgress = { fg = colors.green, bg = statusline_bg },
  St_LspStatus_Icon = { fg = colors.nord_blue, bg = 'none' },
  St_EmptySpace = { fg = colors.grey, bg = colors.lightbg },
  St_EmptySpace2 = { fg = colors.grey, bg = statusline_bg },
  St_location = { fg = colors.grey_fg, bg = 'none', bold = true },
  St_spaces = { fg = colors.grey_fg, bg = 'none' },
  St_encoding = { fg = colors.grey_fg, bg = 'none' },
  St_fileformat = { fg = colors.grey_fg, bg = 'none' },
  St_filesize = { fg = colors.grey_fg, bg = 'none' },
  St_interpreter = { fg = colors.grey_fg, bg = 'none' },
}

-- add common lsp highlights
M.default = merge_tb('force', M.default, Lsp_highlights)

local function genModes_hl(modename, col)
  M.default['St_' .. modename .. 'Mode'] = { bg = 'none', fg = colors[col] }
  M.default['St_' .. modename .. 'ModeSep'] =
    { fg = colors[col], bg = colors.grey }
end

-- add mode highlights
if statusline_theme == 'default' then
  genModes_hl('Normal', 'nord_blue')
else
  genModes_hl('Normal', 'blue')
end

genModes_hl('Visual', 'cyan')
genModes_hl('Insert', 'dark_purple')
genModes_hl('Terminal', 'green')
genModes_hl('NTerminal', 'yellow')
genModes_hl('Replace', 'orange')
genModes_hl('Confirm', 'teal')
genModes_hl('Command', 'green')
genModes_hl('Select', 'blue')

return M[statusline_theme]

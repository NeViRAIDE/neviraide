local colors =
  require('neviraide.ui.neviraide-ui.themes').get_theme_tb('base_30')
local theme =
  require('neviraide.ui.neviraide-ui.themes').get_theme_tb('base_16')

local generate_color =
  require('neviraide.ui.neviraide-ui.themes.colors').change_hex_lightness

local accent = require('neviraide.ui.neviraide-ui.hyprland.utils').wb_colors
-- TODO: make no borders or borders for themes

local defaults = {
  ThemeAccent = {
    fg = accent.active_bg,
  },
  ThemeBG = {
    bg = accent.main_bg,
  },
  ThemeFG = {
    fg = accent.main_fg,
  },
  LineSeparator = {
    fg = accent.main_bg,
    bg = accent.main_bg,
  },

  MatchWord = {
    bg = colors.grey,
    fg = colors.white,
  },

  WinBar = { bg = theme.base00 },
  WinBarNC = { link = 'WinBar' },

  Pmenu = { bg = colors.one_bg },
  PmenuSbar = { bg = colors.one_bg },
  PmenuSel = { bg = accent.active_bg, fg = accent.main_bg, bold = true },
  PmenuThumb = { bg = colors.grey },

  MatchParen = { link = 'MatchWord' },

  Comment = { fg = colors.grey_fg, italic = true },

  CursorLineNr = { fg = colors.white },
  LineNr = { fg = colors.grey },

  -- floating windowr
  FloatBorder = { fg = accent.main_fg },
  NormalFloat = { bg = 'none' },

  NvimInternalError = { fg = colors.red },
  -- FIX: this color for terminals, and change fg color for sipmle windows
  WinSeparator = { fg = theme.base00, bg = theme.base00 },

  Normal = {
    fg = theme.base05,
    bg = theme.base00,
  },

  Bold = {
    bold = true,
  },

  Debug = {
    fg = theme.base08,
  },

  Directory = {
    fg = accent.active_bg,
  },

  Error = {
    fg = theme.base00,
    bg = theme.base08,
  },

  ErrorMsg = {
    fg = theme.base08,
    bg = theme.base00,
  },

  Exception = {
    fg = theme.base08,
  },

  FoldColumn = {
    fg = theme.base0C,
    bg = theme.base01,
  },

  Folded = {
    fg = theme.base03,
    bg = theme.base01,
  },

  IncSearch = {
    fg = theme.base01,
    bg = theme.base09,
  },

  Italic = {
    italic = true,
  },

  Macro = {
    fg = theme.base08,
  },

  ModeMsg = {
    fg = theme.base0B,
  },

  MoreMsg = {
    fg = theme.base0B,
  },

  Question = {
    fg = theme.base0D,
  },

  Search = {
    fg = theme.base01,
    bg = theme.base0A,
  },

  Substitute = {
    fg = theme.base01,
    bg = theme.base0A,
    sp = 'none',
  },

  SpecialKey = {
    fg = theme.base03,
  },

  TooLong = {
    fg = theme.base08,
  },

  UnderLined = {
    underline = true,
  },

  Visual = {
    bg = theme.base02,
  },

  VisualNOS = {
    fg = theme.base08,
  },

  WarningMsg = {
    fg = theme.base08,
  },

  WildMenu = {
    fg = theme.base08,
    bg = theme.base0A,
  },

  Title = {
    fg = theme.base0D,
    sp = 'none',
  },

  Conceal = {
    bg = 'NONE',
  },

  Cursor = {
    fg = theme.base00,
    bg = theme.base05,
  },

  NonText = {
    fg = theme.base03,
  },

  SignColumn = {
    fg = theme.base03,
    sp = 'NONE',
  },

  ColorColumn = {
    bg = theme.base01,
    sp = 'none',
  },

  CursorColumn = {
    bg = theme.base01,
    sp = 'none',
  },

  CursorLine = {
    bg = theme.base01,
    sp = 'none',
  },

  QuickFixLine = {
    bg = theme.base01,
    sp = 'none',
  },

  -- spell
  SpellBad = {
    undercurl = true,
    sp = theme.base08,
  },

  SpellLocal = {
    undercurl = true,
    sp = theme.base0C,
  },

  SpellCap = {
    undercurl = true,
    sp = theme.base0D,
  },

  SpellRare = {
    undercurl = true,
    sp = theme.base0E,
  },

  healthSuccess = {
    bg = colors.green,
    fg = colors.black,
  },

  -- lazy.nvim
  LazyH1 = {
    bg = colors.green,
    fg = colors.black,
  },

  LazyButton = {
    bg = colors.one_bg,
    fg = generate_color(colors.light_grey, vim.o.bg == 'dark' and 10 or -20),
  },

  LazyH2 = {
    fg = colors.red,
    bold = true,
    underline = true,
  },

  LazyReasonPlugin = { fg = colors.red },
  LazyValue = { fg = colors.teal },
  LazyDir = { fg = theme.base05 },
  LazyUrl = { fg = theme.base05 },
  LazyCommit = { fg = colors.green },
  LazyNoCond = { fg = colors.red },
  LazySpecial = { fg = colors.blue },
  LazyReasonFt = { fg = colors.purple },
  LazyOperator = { fg = colors.white },
  LazyReasonKeys = { fg = colors.teal },
  LazyTaskOutput = { fg = colors.white },
  LazyCommitIssue = { fg = colors.pink },
  LazyReasonEvent = { fg = colors.yellow },
  LazyReasonStart = { fg = colors.white },
  LazyReasonRuntime = { fg = colors.nord_blue },
  LazyReasonCmd = { fg = colors.sun },
  LazyReasonSource = { fg = colors.cyan },
  LazyReasonImport = { fg = colors.white },
  LazyProgressDone = { fg = colors.green },
}

local merge_tb = require('neviraide.ui.neviraide-ui.themes').merge_tb
defaults = merge_tb(
  defaults,
  require('neviraide.ui.neviraide-ui.themes').load_highlight('statusline')
)

if vim.g.b == 'none' or vim.g.b == 'shadow' or vim.g.b == 'solid' then
  defaults.FloatBorder = { bg = colors.one_bg, fg = colors.one_bg }
  defaults.NormalFloat = { bg = colors.one_bg }
  defaults.NuiTitle = { bg = colors.green, fg = colors.black }
end

vim.api.nvim_set_hl(0, 'NeviraideTerminalDarkerBG', { bg = accent.main_bg })
vim.api.nvim_set_hl(0, 'NeviraideHelpDarkerBG', { bg = accent.main_bg })
vim.api.nvim_set_hl(0, 'NeviraideTerminalWinbar', { bg = accent.main_bg })

return defaults

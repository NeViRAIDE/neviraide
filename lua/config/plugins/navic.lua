local M = { "SmiteshP/nvim-navic" }

--- Highlight navic icons
---@param parameter string
---@param icon_color string
local function hi_navic(parameter, icon_color)
  hi(parameter, { default = true, bg = color.none, fg = icon_color })
end

function M.config()
  vim.g.navic_silence = true
  require("nvim-navic").setup({
    separator = " ▶ ",
    highlight = true,
    depth_limit = 5,
    save_output = true,
    icons = {
      File          = " ",
      Module        = " ",
      Namespace     = " ",
      Package       = " ",
      Class         = " ",
      Method        = " ",
      Property      = " ",
      Field         = " ",
      Constructor   = " ",
      Enum          = "練",
      Interface     = "練",
      Function      = " ",
      Variable      = " ",
      Constant      = " ",
      String        = " ",
      Number        = " ",
      Boolean       = "◩ ",
      Array         = " ",
      Object        = " ",
      Key           = " ",
      Null          = "ﳠ ",
      EnumMember    = " ",
      Struct        = " ",
      Event         = " ",
      Operator      = " ",
      TypeParameter = " ",
    },
  })

  hi_navic("NavicIconsFile", "#ffffff")
  hi_navic("NavicIconsModule", "#ffffff")
  hi_navic("NavicIconsNamespace", "#ffffff")
  hi_navic("NavicIconsPackage", "#ffffff")
  hi_navic("NavicIconsClass", "#ffffff")
  hi_navic("NavicIconsMethod", "#d194c7")
  hi_navic("NavicIconsProperty", "#d194c7")
  hi_navic("NavicIconsField", "#ffffff")
  hi_navic("NavicIconsConstructor", "#ffffff")
  hi_navic("NavicIconsEnum", "#ffffff")
  hi_navic("NavicIconsInterface", "#ffffff")
  hi_navic("NavicIconsFunction", "#ffc66b")
  hi_navic("NavicIconsVariable", "#d194c7")
  hi_navic("NavicIconsConstant", "#cd7832")
  hi_navic("NavicIconsString", "#8fa867")
  hi_navic("NavicIconsNumber", "#68a0ee")
  hi_navic("NavicIconsBoolean", "#cd7832")
  hi_navic("NavicIconsArray", "#ffffff")
  hi_navic("NavicIconsObject", "#ffffff")
  hi_navic("NavicIconsKey", "#cd7832")
  hi_navic("NavicIconsNull", "#ffffff")
  hi_navic("NavicIconsEnumMember", "#ffffff")
  hi_navic("NavicIconsStruct", "#d194c7")
  hi_navic("NavicIconsEvent", "#ffffff")
  hi_navic("NavicIconsOperator", "#ffffff")
  hi_navic("NavicIconsTypeParameter", "#ffffff")
  hi_navic("NavicText", "#ffffff")
  hi_navic("NavicSeparator", color.red)
end

return M

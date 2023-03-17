local M = { 'SmiteshP/nvim-navic' }

--- Highlight navic icons
---@param parameter string
---@param icon_color string
local function hi_navic(parameter, icon_color)
  hi(parameter, { default = true, bg = color.none, fg = icon_color })
end

function M.config()
  vim.g.navic_silence = true
  require('nvim-navic').setup({
    separator = ' ' .. icon('triangle-right', ' ▶ ', ' > '),
    highlight = true,
    depth_limit = 5,
    save_output = true,
    icons = {
      Class = icon('class', '', '') .. ' ',
      Field = icon('field', '', '') .. ' ',
      Interface = icon('interface', '', '') .. ' ',
      Variable = icon('variable', '', '') .. ' ',
      Constant = icon('constant', '', '') .. ' ',
      Number = icon('number', '', '') .. ' ',
      Key = icon('keyword', '', '') .. ' ',
      Struct = icon('struct', '', '') .. ' ',
      File = icon('file', '', '') .. ' ',
      Module = icon('file-submodule', '', '') .. ' ',
      Package = icon('package', '', '') .. ' ',
      Namespace = ' ',
      Method = ' ',
      Property = ' ',
      Constructor = ' ',
      Enum = '練',
      Function = ' ',
      String = ' ',
      Boolean = '◩ ',
      Array = ' ',
      Object = ' ',
      Null = 'ﳠ ',
      EnumMember = ' ',
      Event = ' ',
      Operator = ' ',
      TypeParameter = ' ',
    },
  })

  hi_navic('NavicIconsFile', color.white)
  hi_navic('NavicIconsModule', color.darculaYellow)
  hi_navic('NavicIconsNamespace', color.white)
  hi_navic('NavicIconsPackage', color.white)
  hi_navic('NavicIconsClass', color.white)
  hi_navic('NavicIconsMethod', color.darculaPink)
  hi_navic('NavicIconsProperty', color.darculaPink)
  hi_navic('NavicIconsField', color.white)
  hi_navic('NavicIconsConstructor', color.white)
  hi_navic('NavicIconsEnum', color.white)
  hi_navic('NavicIconsInterface', color.white)
  hi_navic('NavicIconsFunction', color.darculaYellow)
  hi_navic('NavicIconsVariable', color.darculaPink)
  hi_navic('NavicIconsConstant', color.darculaOrange)
  hi_navic('NavicIconsString', color.darculaGreen)
  hi_navic('NavicIconsNumber', color.darculaBlue)
  hi_navic('NavicIconsBoolean', color.darculaOrange)
  hi_navic('NavicIconsArray', color.white)
  hi_navic('NavicIconsObject', color.white)
  hi_navic('NavicIconsKey', color.darculaOrange)
  hi_navic('NavicIconsNull', color.white)
  hi_navic('NavicIconsEnumMember', color.white)
  hi_navic('NavicIconsStruct', color.darculaPink)
  hi_navic('NavicIconsEvent', color.white)
  hi_navic('NavicIconsOperator', color.white)
  hi_navic('NavicIconsTypeParameter', color.white)
  hi_navic('NavicText', color.white)
  hi_navic('NavicSeparator', color.red)
end

return M

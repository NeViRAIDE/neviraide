local colors =
  require('neviraide.ui.neviraide-ui.themes').get_theme_tb('base_30')

---@return string
local function style()
  if
    vim.g.borders == 'none'
    or vim.g.borders == 'shadow'
    or vim.g.borders == 'solid'
  then
    return 'borderless'
  end
  return 'bordered'
end

local styles = {
  borderless = {
    NotifyBackground = { link = 'NormalFloat' },

    NotifyERRORBorder = { link = 'NormalFloat' },
    NotifyERRORIcon = { bg = colors.red, fg = colors.black },
    NotifyERRORTitle = { bg = colors.red, fg = colors.black },
    NotifyERRORBody = { bg = colors.one_bg },

    NotifyWARNBorder = { link = 'NormalFloat' },
    NotifyWARNIcon = { bg = colors.orange, fg = colors.black },
    NotifyWARNTitle = { bg = colors.orange, fg = colors.black },
    NotifyWARNBody = { bg = colors.one_bg },

    NotifyINFOBorder = { link = 'NormalFloat' },
    NotifyINFOIcon = { bg = colors.green, fg = colors.black },
    NotifyINFOTitle = { bg = colors.green, fg = colors.black },
    NotifyINFOBody = { bg = colors.one_bg },

    NotifyDEBUGBorder = { link = 'NormalFloat' },
    NotifyDEBUGIcon = { bg = colors.grey, fg = colors.black },
    NotifyDEBUGTitle = { bg = colors.grey, fg = colors.black },
    NotifyDEBUGBody = { bg = colors.one_bg },

    NotifyTRACEBorder = { link = 'NormalFloat' },
    NotifyTRACEIcon = { bg = colors.purple, fg = colors.black },
    NotifyTRACETitle = { bg = colors.purple, fg = colors.black },
    NotifyTRACEBody = { bg = colors.one_bg },
  },

  bordered = {
    NotifyERRORBorder = { fg = colors.red },
    NotifyERRORIcon = { fg = colors.red },
    NotifyERRORTitle = { fg = colors.red },
    NotifyERRORBody = { bg = 'none' },

    NotifyWARNBorder = { fg = colors.orange },
    NotifyWARNIcon = { fg = colors.orange },
    NotifyWARNTitle = { fg = colors.orange },
    NotifyWARNBody = { bg = 'none' },

    NotifyINFOBorder = { fg = colors.green },
    NotifyINFOIcon = { fg = colors.green },
    NotifyINFOTitle = { fg = colors.green },
    NotifyINFOBody = { bg = 'none' },

    NotifyDEBUGBorder = { fg = colors.grey },
    NotifyDEBUGIcon = { fg = colors.grey },
    NotifyDEBUGTitle = { fg = colors.grey },
    NotifyDEBUGBody = { bg = 'none' },

    NotifyTRACEBorder = { fg = colors.purple },
    NotifyTRACEIcon = { fg = colors.purple },
    NotifyTRACETitle = { fg = colors.purple },
    NotifyTRACEBody = { bg = 'none' },
  },
}

local hlgroups = {
  NotifyERRORBorder = { fg = colors.red },
  NotifyERRORIcon = { fg = colors.red },
  NotifyERRORTitle = { fg = colors.red },

  NotifyWARNBorder = { fg = colors.orange },
  NotifyWARNIcon = { fg = colors.orange },
  NotifyWARNTitle = { fg = colors.orange },

  NotifyINFOBorder = { fg = colors.green },
  NotifyINFOIcon = { fg = colors.green },
  NotifyINFOTitle = { fg = colors.green },

  NotifyDEBUGBorder = { fg = colors.grey },
  NotifyDEBUGIcon = { fg = colors.grey },
  NotifyDEBUGTitle = { fg = colors.grey },

  NotifyTRACEBorder = { fg = colors.purple },
  NotifyTRACEIcon = { fg = colors.purple },
  NotifyTRACETitle = { fg = colors.purple },
}

local result = vim.tbl_deep_extend('force', hlgroups, styles[style()])

return result

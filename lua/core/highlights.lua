local utils = require("core.utils")

-- TODO: mixed highlight (bg from link, fg from another)
utils.autocmd("NEVIRAIDE_HIGHLIGHTS", "ColorScheme", {
  pattern = "*",
  callback = function()
    utils.hi('BreadcrumbSep', { fg = "#e78284", --[[ bg = "#292c3c" ]] })
    utils.hi('NavicSeparator', { fg = "#e78284", --[[ bg = "#292c3c" ]] })
    utils.hi('BreadcrumbDir', { link = "Directory" })
  end,
}
)

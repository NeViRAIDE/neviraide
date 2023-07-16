local utils = require("core.utils")

utils.autocmd("NEVIRAIDE_HIGHLIGHTS", "ColorScheme", {
  pattern = "*",
  callback = function()
    utils.hi('BreadcrumbSep', { fg = "#e78284", })
    utils.hi('NavicSeparator', { fg = "#e78284", })
    utils.hi('BreadcrumbDir', { link = "Directory" })
  end,
}
)

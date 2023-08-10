return function()
  local Popup = require('nui.popup')
  local theme_count = #require('plugins.themes')
  local ui = require('NEVIRAIDE').ui

  return Popup({
    position = { row = 3, col = '100%' },
    size = { width = 20, height = theme_count },
    enter = true,
    focusable = true,
    zindex = 999,
    relative = 'editor',
    border = {
      padding = {
        top = 1,
        bottom = 1,
        left = 2,
        right = 2,
      },
      style = 'rounded',
      text = {
        top = ' Colorschemes ',
        top_align = 'right',
        bottom = ' ' .. ui.theme:gsub('^%l', string.upper) .. ' ',
      },
    },
    buf_options = {
      modifiable = false,
      readonly = true,
      filetype = 'nui_themes',
    },
    win_options = {
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
    },
  })
end

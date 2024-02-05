local count = require('neviraide.ui.neviraide-ui.utils').dirLookup

return function()
  local Popup = require('nui.popup')

  local utils = require('neviraide.ui.neviraide-ui.override_vim_ui.utils')
  local border =
    require('neviraide.ui.neviraide-ui.override_vim_ui.nui_float_border')

  local text = {
    top = ' Colorschemes ',
    top_align = 'right',
    bottom = ' '
      .. NEVIRAIDE().theme:gsub('./', ''):gsub('^%l', string.upper)
      .. ' ',
  }

  return Popup({
    position = { row = 3, col = '97%' },
    size = { width = 20, height = #count() },
    enter = true,
    focusable = true,
    zindex = 999,
    relative = 'editor',
    border = border(text).border,
    win_options = utils.popup_bg(border),
    buf_options = {
      modifiable = false,
      readonly = true,
      filetype = 'colorschemes',
    },
  })
end

return function()
  local Input = require('nui.input')
  local event = require('nui.utils.autocmd').event
  local utils = require('neviraide.ui.neviraide-ui.override_vim_ui.utils')

  local text = {
    bottom = ' Rename tab ',
    bottom_align = 'center',
  }

  local input = Input({
    position = { row = '5%', col = '100%' },
    size = { width = 30 },
    border = utils.nui_border(text),
    win_options = utils.popup_bg(),
    relative = 'editor',
    buf_options = {
      filetype = 'renameTab',
    },
  }, {
    prompt = '',
    default_value = '',
    on_submit = function(value)
      require('neviraide.ui.neviraide-ui.buftabline.modules.components').setTabTitle(
        value
      )
    end,
  })
  input:on(event.BufLeave, function() input:unmount() end)
  input:map(
    'n',
    { '<Esc>', 'q', '<C-c>' },
    function() input:unmount() end,
    { noremap = true, nowait = true }
  )
  input:map(
    'i',
    { '<Esc>', '<C-q>', '<C-c>' },
    function() input:unmount() end,
    { noremap = true, nowait = true }
  )
  input:mount()
end

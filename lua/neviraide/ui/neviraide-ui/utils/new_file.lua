return function()
  local Input = require('nui.input')
  local event = require('nui.utils.autocmd').event
  local utils = require('neviraide.ui.neviraide-ui.override_vim_ui.utils')

  local text = {
    top = ' Create a new file ',
    top_align = 'center',
  }

  local input = Input({
    position = { row = '90%', col = '50%' },
    size = { width = 40 },
    border = utils.nui_border(text),
    win_options = utils.popup_bg(),
    relative = 'editor',
    buf_options = {
      filetype = 'create',
    },
  }, {
    prompt = '',
    default_value = '',
    on_submit = function(value)
      vim.fn.execute('enew')
      vim.fn.execute('w ' .. value)
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

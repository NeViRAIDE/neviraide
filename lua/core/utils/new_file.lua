local Input = require('nui.input')
local event = require('nui.utils.autocmd').event

return function()
  local input = Input({
    position = '50%',
    size = {
      width = 40,
    },
    border = {
      style = 'rounded',
      text = {
        top = ' Create a new file ',
        top_align = 'center',
      },
      padding = { 0, 1 },
    },
    relative = 'editor',
    win_options = {
      winhighlight = 'Normal:String,FloatBorder:AlphaFortune',
    },
    buf_options = {
      filetype = 'nui_new',
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

local Input = require('nui.input')
local event = require('nui.utils.autocmd').event

_G.dashNewFile = function()
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
      winhighlight = 'Normal:String,FloatBorder:String',
    },
  }, {
    prompt = '',
    default_value = '',
    on_close = function()
      require('notify').notify('New file was not created!', 'error')
    end,
    on_submit = function(value)
      vim.fn.execute('DashboardNewFile')
      vim.fn.execute('w ' .. value)
    end,
  })
  input:on(event.BufLeave, function() input:unmount() end)
  input:mount()
end
-- TODO: as description add session date || no session

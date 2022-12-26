local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

_G.inputMod = Input({
  position = "50%",
  size = {
    width = 30,
  },
  border = {
    style = "rounded",
    text = {
      top = " Module name is: ",
      top_align = "center",
    },
    padding = { 0, 1 }
  },
  relative = "editor",
  win_options = {
    winhighlight = "Normal:Normal,FloatBorder:VertSplit",
  },
}, {
  prompt = "",
  default_value = "",
  on_close = function()
    require('notify').notify("Input Closed!", "error")
  end,
  on_submit = function(value)
    vim.fn.execute('GoMod init ' .. value)
  end,
})

_G.inputMod:on(event.BufLeave, function() inputMod:unmount() end)

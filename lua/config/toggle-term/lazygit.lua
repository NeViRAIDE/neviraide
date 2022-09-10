local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = 'lazygit',
  count = 42,
  hidden = true,
  direction = 'float',
  float_opts = {
    border = 'rounded',
  },
})
function _G.lazygit_toggle() lazygit:toggle() end

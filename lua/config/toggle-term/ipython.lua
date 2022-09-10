local Terminal = require('toggleterm.terminal').Terminal

local ipython = Terminal:new({
  cmd = 'ipython',
  count = 23,
  direction = 'vertical',
})

local current_file_ipython = Terminal:new({
  cmd = 'ipython -i ' .. vim.fn.expand('%'),
  count = 23,
  direction = 'vertical',
})

function _G.ipython_toggle() ipython:toggle() end
function _G.current_file_ipython_toggle() current_file_ipython:toggle() end

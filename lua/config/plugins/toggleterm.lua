local M = {
  'akinsho/toggleterm.nvim',
  version = '*',
  event = 'VeryLazy',
}

function M.config()
  require('toggleterm').setup({
    open_mapping = [[<c-\>]],
    winbar = {
      enabled = true,
    },
  })

  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new({
    cmd = 'lazygit',
    hidden = true,
    count = 42,
    direction = 'float',
    float_opts = {
      border = 'rounded',
    },
  })
  function _G.lazygit_toggle() lazygit:toggle() end
end

return M

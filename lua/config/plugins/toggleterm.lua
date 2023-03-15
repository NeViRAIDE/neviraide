-- TODO: find alternatives
-- FIX: not correct work when there are split windows
local M = {
  'akinsho/toggleterm.nvim',
  version = '*',
  event = 'VeryLazy',
}

function M.config()
  require('toggleterm').setup({
    open_mapping = '<C-\\>',
    size = function(term)
      if term.direction == 'horizontal' then
        return vim.o.lines * 0.4
      elseif term.direction == 'vertical' then
        return vim.o.columns * 0.4
      end
    end,
    winbar = {
      enabled = true,
    },
    float_opts = {
      border = 'rounded',
      width = function(term) return math.floor(vim.o.columns * 0.6) end,
      height = function(term) return math.floor(vim.o.lines * 0.5) end,
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
      width = function(term) return math.floor(vim.o.columns * 0.85) end,
      height = function(term) return math.floor(vim.o.lines * 0.85) end,
    },
  })
  function _G.lazygit_toggle() lazygit:toggle() end
end

return M

local M = {
  'anuvyklack/windows.nvim',
  event = 'VeryLazy',
  dependencies = {
    { 'anuvyklack/middleclass' },
    { 'anuvyklack/animation.nvim' },
  },
}

function M.config()
  vim.o.winwidth = 5
  vim.o.winminwidth = 5
  vim.o.equalalways = false
  require('windows').setup({
    animation = {
      duration = 150,
      fps = 60,
    },
  })
end

return M

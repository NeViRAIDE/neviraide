local M = { 'SmiteshP/nvim-navic' }

function M.config()
  vim.g.navic_silence = true
  require('nvim-navic').setup({
    separator = ' ▶ ',
    highlight = true,
    depth_limit = 5,
    save_output = true,
  })
end

return M

local M = {
  'lewis6991/gitsigns.nvim',
  event = 'BufReadPre',
}

function M.config()
  require('gitsigns').setup({
    current_line_blame = true,
    current_line_blame_formatter = '<author>, <author_time:%d %B %Y> - <summary>',
    preview_config = {
      border = 'rounded',
    },
  })
end

return M

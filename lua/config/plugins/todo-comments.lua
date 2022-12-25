local M = {
  "folke/todo-comments.nvim",
  config = function()
    require("config.plugins.todo-comments")
  end,
  event = "BufReadPost"
}
function M.config()
  require('todo-comments').setup({
    signs = true,
    sign_priority = 8,
    merge_keywords = true,
    highlight = {
      before = '',
      keyword = 'wide',
      after = 'fg',
      pattern = [[.*<(KEYWORDS)\s*:]],
      comments_only = true,
      max_line_len = 400,
    },
    search = {
      command = 'rg',
      args = {
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
      },
      pattern = [[\b(KEYWORDS):]],
    },
  })
end

return M

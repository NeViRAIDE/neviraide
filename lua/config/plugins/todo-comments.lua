local M = {
  'folke/todo-comments.nvim',
  config = function() require('config.plugins.todo-comments') end,
}

function M.config()
  require('todo-comments').setup({
    signs = true,
    sign_priority = 8,
    keywords = {
      FIX = { icon = icon('meter', '', 'F'), color = color.fix },
      TODO = { icon = icon('check-circle', '', 'T'), color = color.todo },
      HACK = { icon = icon('flame', '🔥', 'H'), color = color.hack },
      WARN = { icon = icon('alert', '⚠️ ', 'W'), color = color.warn },
      PERF = { icon = icon('stopwatch', '⏱️ ', 'P'), color = color.perf },
      NOTE = { icon = icon('note', '📝', 'N'), color = color.note },
    },
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

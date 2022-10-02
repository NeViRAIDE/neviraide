require('todo-comments').setup({
  signs = true,
  sign_priority = 8,
  keywords = {
    FIX = { icon = icon('meter'), color = color.fix },
    TODO = { icon = icon('check-circle'), color = color.todo },
    HACK = { icon = icon('flame'), color = color.hack },
    WARN = { icon = icon('alert'), color = color.warn },
    PERF = { icon = icon('stopwatch'), color = color.perf },
    NOTE = { icon = icon('note'), color = color.note },
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

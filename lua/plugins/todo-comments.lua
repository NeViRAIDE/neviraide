return {
  'folke/todo-comments.nvim',
  cmd = 'TodoTelescope',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = function()
    local icon = require('stigmata.utils').icon

    return {
      keywords = {
        FIX = { icon = icon('', 'bug', 0, 1) },
        TODO = { icon = icon('', 'check', 0, 1) },
        HACK = { icon = icon('', 'flame', 0, 1) },
        WARN = { icon = icon('', 'alert', 0, 1) },
        PERF = { icon = icon('', 'stopwatch', 0, 1) },
        NOTE = { icon = icon('', 'note', 0, 1) },
        TEST = { icon = icon('⏲', 'hourglass', 0, 1) },
      },
    }
  end,
  config = function(_, opts)
    local todo = require('todo-comments')
    todo.setup(opts)

    local a = require('plenary.async')
    local todo_search = require('todo-comments.search')

    vim.g.todo_counter = nil

    local countTodos = a.wrap(function(callback)
      todo_search.search(a.void(function(results) callback(#results) end), {
        disable_not_found_warnings = true,
      })
    end, 2)

    require('neviraide.utils').autocmd('NEVIRAIDE_TODOS_COUNTER', {
      'BufWritePost',
      'BufReadPost',
      'BufNewFile',
    }, {
      pattern = '*',
      callback = function()
        a.run(function()
          countTodos(function(result) vim.g.todo_counter = result end)
        end)
      end,
    })
  end,
}

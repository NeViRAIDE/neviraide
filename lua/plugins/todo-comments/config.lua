return function(_, opts)
  local todo = require('todo-comments')
  todo.setup(opts)

  local a = require('plenary.async')
  local todo_search = require('todo-comments.search')

  vim.g.todo_counter = 0

  local countTodos = a.wrap(function(callback)
    todo_search.search(a.void(function(results) callback(#results) end), {
      disable_not_found_warnings = true,
    })
  end, 2)

  require('neviraide.utils').autocmd(
    'NEVIRAIDE_TODOS_COUNTER',
    { 'BufWritePost', 'BufEnter', 'BufWinEnter' },
    {
      pattern = '*',
      callback = function()
        a.run(function()
          countTodos(function(result) vim.g.todo_counter = result end)
        end)
      end,
    }
  )
end

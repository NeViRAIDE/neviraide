-- FIX: rgb bars always grey
-- FIX: error: method textDocument/codeLens is not supported by any of the servers registered for the current buffer

return function()
  return {
    win_opts = {
      -- relative = 'cursor',
      -- row = 1,
      -- col = 1,
      -- style = 'minimal',
      border = vim.g.b,
    },
    highlighter = {
      auto_enable = true,
      excludes = { 'neo-tree' },
      lsp = true,
    },
  }
end

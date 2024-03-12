return function()
  return {
    -- pickers = {
    --   require('ccc').picker.custom_entries(
    --     require('neviraide-ui.themes.colors').palette
    --   ),
    -- },
    win_opts = {
      border = vim.g.b,
    },
    highlighter = {
      auto_enable = true,
      excludes = { 'neo-tree' },
      lsp = true,
    },
  }
end

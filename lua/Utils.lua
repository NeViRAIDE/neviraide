return {
  "nvim-lua/plenary.nvim",

  {
    'Shatur/neovim-session-manager',
    cmd = "SessionManager",
    opts = function()
      return {
        sessions_dir = require('plenary.path'):new(
          vim.fn.stdpath('cache'),
          'sessions'
        ),
        autosave_last_session = false,
      }
    end
  },
}

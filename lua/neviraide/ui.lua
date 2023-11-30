return {
  {
    -- 'RAprogramm/neviraide-ui.nvim',
    dir = '~/GitHub/nvim_plugins/neviraide-ui.nvim',
    name = 'UI',
    event = 'VeryLazy',
    opts = {
      -- INFO: uncomment if you don't want to follow hyprland theme
      -- hyprTheme = false,
    },
    config = function(_, opts)
      local UI = require('neviraide-ui')
      UI.setup(opts)
    end,
  },
}

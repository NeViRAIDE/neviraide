return {
  {
    'nvim-lua/plenary.nvim',
    version = '*',
  },
  {
    -- 'RAprogramm/neviraide-ui.nvim'
    dir = '~/Study/nvim_plugins/neviraide-ui.nvim',
    name = 'UI',
    event = 'VeryLazy',
    -- build = function() require('neviraide-ui.themes').load_all_highlights() end,
    -- init = function() require('neviraide.utils').lazy_load('neviraide-ui.nvim') end,
  },
}

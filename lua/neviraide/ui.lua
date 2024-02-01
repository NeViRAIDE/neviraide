return {
  'RAprogramm/neviraide-ui.nvim',
  -- dir = '~/GitHub/nvim_plugins/neviraide-ui.nvim',
  event = 'VeryLazy',
  dependencies = {
    {
      'rcarriga/nvim-notify',
      opts = function()
        dofile(vim.g.neviraide_themes_cache .. 'notify')
        return { minimum_width = 10 }
      end,
    },
  },
}

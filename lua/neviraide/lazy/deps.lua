local util = require('neviraide.utils')

return {
  { 'nvim-lua/plenary.nvim' },
  { 'MunifTanjim/nui.nvim' },
  {
    'rcarriga/nvim-notify',
    opts = function()
      dofile(vim.g.ntc .. 'notify')
      return { minimum_width = 10 }
    end,
  },
  {
    'nvim-tree/nvim-web-devicons',
    opts = function() return { override = util.icons().global } end,
    config = function(_, opts)
      dofile(vim.g.ntc .. 'icons')
      require('nvim-web-devicons').setup(opts)
    end,
  },
}

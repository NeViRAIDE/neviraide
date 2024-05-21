return {
  'nvim-tree/nvim-web-devicons',
  opts = { override = require('neviraide.utils').icons().global },
  config = function(_, opts)
    dofile(vim.g.ntc .. 'icons')
    require('nvim-web-devicons').setup(opts)
  end,
}

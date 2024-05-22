return {
  'nvim-tree/nvim-web-devicons',
  opts = { override = require('stigmata.utils').icons_type().global },
  config = function(_, opts)
    dofile(vim.g.ntc .. 'icons')
    require('nvim-web-devicons').setup(opts)
  end,
}

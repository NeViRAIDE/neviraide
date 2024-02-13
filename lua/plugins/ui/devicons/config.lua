return function(_, opts)
  dofile(vim.g.ntc .. 'icons')
  require('nvim-web-devicons').setup(opts)
end

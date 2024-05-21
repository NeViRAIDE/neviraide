return {
  'NvChad/nvterm',
  opts = {
    terminals = {
      type_opts = {
        float = { border = vim.g.b },
      },
    },
  },
  config = function(_, opts)
    require('chameleon.term')
    require('nvterm').setup(opts)
  end,
}

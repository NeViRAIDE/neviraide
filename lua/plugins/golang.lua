return {
  {
    'olexsmir/gopher.nvim',
    version = '*',
    ft = 'go',
    config = function()
      require('gopher').setup({
        commands = {
          go = 'go',
          gomodifytags = 'gomodifytags',
          gotests = 'gotests',
          impl = 'impl',
          iferr = 'iferr',
        },
      })
      require('gopher.dap').setup()
    end,
  },
}

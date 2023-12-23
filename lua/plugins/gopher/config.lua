-- TODO: make available only if golang in the NEVIRAIDE config
return function()
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
end

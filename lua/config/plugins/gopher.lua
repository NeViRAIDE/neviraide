local M = {
  'olexsmir/gopher.nvim',
  event = 'BufReadPre',
}

function M.config()
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

  require('utils.golang')
end

return M

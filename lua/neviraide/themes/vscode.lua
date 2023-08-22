local ui = require('NEVIRAIDE')

return {
  name = 'VSCode',
  colors = {
    { bg = 'dark', name = 'Dark', cmd = 'vscode' },
    { bg = 'light', name = 'Light', cmd = 'vscode' },
  },
  plugin = {
    'Mofiqul/vscode.nvim',
    version = '*',
    opts = {
      transparent = ui.transparency,
      style = ui.background,
      -- :lua require('vscode').load('light')
      -- :lua require('vscode').load('dark')
    },
  },
}

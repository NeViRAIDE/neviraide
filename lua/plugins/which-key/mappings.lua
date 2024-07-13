return function()
  local wk = require('which-key')

  wk.add(require('plugins.which-key.modes.normal'))
  wk.add(require('plugins.which-key.modes.visual'))
  wk.add(require('plugins.which-key.modes.terminal'))
  wk.add(require('plugins.which-key.modes.insert'))
end

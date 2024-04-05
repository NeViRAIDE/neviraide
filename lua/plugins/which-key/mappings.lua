return function()
  local wk = require('which-key')

  wk.register(require('plugins.which-key.modes.normal'), { mode = 'n' })
  wk.register(require('plugins.which-key.modes.visual'), { mode = 'v' })
  wk.register(require('plugins.which-key.modes.terminal'), { mode = 't' })
  wk.register(require('plugins.which-key.modes.insert'), { mode = 'i' })
end

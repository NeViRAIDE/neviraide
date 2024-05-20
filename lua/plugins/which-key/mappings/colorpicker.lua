local icon = require('stigmata.utils').icon

return {
  name = 'Color Picker' .. icon('', 'paintbrush', 1),
  p = { ':CccPick<cr>', 'Pick color' },
  c = { ':CccConvert<cr>', 'Conver color' },
  t = { ':CccHighlighterToggle<cr>', 'Toggle highlights' },
}

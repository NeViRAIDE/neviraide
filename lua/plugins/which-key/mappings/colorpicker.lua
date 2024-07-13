local icon = require('stigmata.utils').icon

return {
  { '<leader>uc', group = 'Color Picker', icon = icon('', 'paintbrush') },
  { '<leader>ucp', '<cmd>CccPick<cr>', desc = 'Pick color' },
  { '<leader>ucc', '<cmd>CccConvert<cr>', desc = 'Conver color' },
  {
    '<leader>uct',
    '<cmd>CccHighlighterToggle<cr>',
    desc = 'Toggle highlights',
  },
}

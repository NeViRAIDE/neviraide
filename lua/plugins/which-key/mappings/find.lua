local icon = require('stigmata.utils').icon

return {
  name = 'Find' .. icon('', 'search', 1, 1),
  a = { '<cmd>Telescope autocommands<cr>', 'Autocommands' },
  f = { '<cmd>Telescope find_files<cr>', 'Files in current directory' },
  h = { '<cmd>Telescope help_tags<cr>', 'Help tags' },
  H = { '<cmd>Telescope highlights<cr>', 'Highlights' },
  m = { '<cmd>Telescope man_pages<cr>', 'Manual pages' },
  n = { '<cmd>Telescope notify<cr>', 'Notifications' },
  r = {
    '<cmd>Telescope oldfiles cwd_only=v:true<cr>',
    'Recent files in current directory',
  },
  w = { '<cmd>Telescope live_grep<cr>', 'Word in files' },
}

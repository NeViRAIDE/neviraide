local icon = require('stigmata.utils').icon

return {
  { '<leader>f', group = 'Find', icon = icon('', 'search') },
  { '<leader>fa', '<cmd>Telescope autocommands<cr>', desc = 'Autocommands' },
  {
    '<leader>ff',
    '<cmd>Telescope find_files<cr>',
    desc = 'Files in current directory',
  },
  { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help tags' },
  { '<leader>fH', '<cmd>Telescope highlights<cr>', desc = 'Highlights' },
  { '<leader>fm', '<cmd>Telescope man_pages<cr>', desc = 'Manual pages' },
  { '<leader>fn', '<cmd>Telescope notify<cr>', desc = 'Notifications' },
  {
    '<leader>fr',
    '<cmd>Telescope oldfiles cwd_only=v:true<cr>',
    desc = 'Recent files in current directory',
  },
  { '<leader>fw', '<cmd>Telescope live_grep<cr>', desc = 'Word in files' },
}

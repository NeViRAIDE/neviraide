return {
  name = 'Telescope ' .. '',
  a = { '<cmd>Telescope autocommands<cr>', 'Autocommands' },
  m = { '<cmd>Telescope man_pages<cr>', 'Manual pages' },
  r = {
    '<cmd>Telescope oldfiles cwd_only=v:true<cr>',
    'Recent files in current directory',
  },
  f = { '<cmd>Telescope find_files<cr>', 'Find files' },
  w = { '<cmd>Telescope live_grep<cr>', 'Find word' },
  h = { '<cmd>Telescope help_tags<cr>', 'Help tags' },
  H = { '<cmd>Telescope highlights<cr>', 'Highlights' },
}

return {
  name = 'Buffers ' .. icon('versions', '﬘', ''),
  p = { ':bprev<cr>', 'Previous' },
  n = { ':bnext<cr>', 'Next' },
  d = { ':lua close_buffer()<cr>', 'Delete' },
  D = { ':%bd | Alpha<cr>', 'Delete all buffers' },
  C = { ':%bd | e# | bd#<cr>', 'Delete buffers except current' },
  l = { '<cmd>Telescope buffers<cr>', 'List' },
  L = { '<cmd>Neotree buffers focus float<cr>', 'List (Neotree)' },
}

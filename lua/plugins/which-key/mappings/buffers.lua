local i = require('stigmata.utils').icon

return {
  name = 'Buffers' .. i('b', 'tmux', 1),
  d = {
    name = 'Delete' .. i('', 'trash', 1),
    c = {
      function() require('nevitabs').close_buffer() end,
      'Current',
    },
    a = {
      function() require('nevitabs').closeOtherBufs() end,
      'All, except current',
    },
    A = {
      function()
        require('nevitabs').closeAllBufs()
        require('nevitabs').close_buffer()
      end,
      'All',
    },
    l = {
      function() require('nevitabs').closeBufs_at_direction('left') end,
      'All to the left of the current one',
    },
    r = {
      function() require('nevitabs').closeBufs_at_direction('right') end,
      'All to the right of the current one',
    },
  },
  m = {
    name = 'Move',
    l = {
      function() require('nevitabs').move_buf(-1) end,
      'Move to the left',
    },
    r = {
      function() require('nevitabs').move_buf(1) end,
      'Move to the right',
    },
  },
  l = {
    '<cmd>Neotree buffers focus float toggle<cr>',
    'Toggle buffers list (Neotree)' .. i('', 'list-unordered', 1),
  },
  n = {
    function() require('nevitabs').tabuflineNext() end,
    'Go to the next',
  },
  p = {
    function() require('nevitabs').tabuflinePrev() end,
    'Go to the previous',
  },
}

local i = require('neviraide-ui.icons.utils').icon

return {
  name = 'Buffers' .. i('b', 'tmux', 1),
  d = {
    name = 'Delete' .. i('', 'trash', 1),
    c = {
      function() require('neviraide-ui.buftabline').close_buffer() end,
      'Current',
    },
    a = {
      function() require('neviraide-ui.buftabline').closeOtherBufs() end,
      'All, except current',
    },
    A = {
      function()
        require('neviraide-ui.buftabline').closeAllBufs()
        require('neviraide-ui.buftabline').close_buffer()
      end,
      'All',
    },
    l = {
      function()
        require('neviraide-ui.buftabline').closeBufs_at_direction('left')
      end,
      'All to the left of the current one',
    },
    r = {
      function()
        require('neviraide-ui.buftabline').closeBufs_at_direction('right')
      end,
      'All to the right of the current one',
    },
  },
  m = {
    name = 'Move',
    l = {
      function() require('neviraide-ui.buftabline').move_buf(-1) end,
      'Move to the left',
    },
    r = {
      function() require('neviraide-ui.buftabline').move_buf(1) end,
      'Move to the right',
    },
  },
  l = {
    '<cmd>Neotree buffers focus float toggle<cr>',
    'Toggle buffers list (Neotree)' .. i('', 'list-unordered', 1),
  },
  n = {
    function() require('neviraide-ui.buftabline').tabuflineNext() end,
    'Go to the next',
  },
  p = {
    function() require('neviraide-ui.buftabline').tabuflinePrev() end,
    'Go to the previous',
  },
}

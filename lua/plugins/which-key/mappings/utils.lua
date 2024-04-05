local icon = require('neviraide-ui.icons.utils').icon

return {
  name = 'Utils' .. icon('', 'tools', 1),
  t = { '<cmd>Translate ' .. vim.g.lang .. '<cr>', 'Translate' },
  T = {
    name = 'Timer',
    s = {
      function()
        require('neviraide-ui.utils.change_settings.timer').startTimer()
      end,
      'Start',
    },
    p = {
      '<cmd>TimerPause<cr>',
      'Pause',
    },
    S = {
      '<cmd>TimerStop<cr>',
      'Stop',
    },
  },
}

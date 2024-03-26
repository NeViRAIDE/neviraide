local icon = require('neviraide-ui.icons.utils').icon

return {
  name = 'Utils' .. icon('', 'tools', 1),
  t = {
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

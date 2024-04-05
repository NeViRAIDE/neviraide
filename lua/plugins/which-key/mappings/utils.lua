local icon = require('neviraide-ui.icons.utils').icon

return {
  name = 'Utils' .. icon('', 'tools', 1),
  c = require('plugins.which-key.mappings.colorpicker'),
  n = require('plugins.which-key.mappings.notes'),
  t = { '<cmd>Translate ' .. vim.g.lang .. '<cr>', 'Translate 󰗊 ' },
  T = {
    name = 'Timer' .. icon('󰔛', 'stopwatch', 1, 1),
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

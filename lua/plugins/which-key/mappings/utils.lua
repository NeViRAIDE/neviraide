local icon = require('stigmata.utils').icon

return {
  require('plugins.which-key.mappings.colorpicker'),
  require('plugins.which-key.mappings.notes'),

  { '<leader>u', group = 'Utils', icon = icon('', 'tools') },
  {
    '<leader>ut',
    '<cmd>Translate ' .. vim.g.lang .. '<cr>',
    desc = 'Translate',
    icon = '󰗊 ',
  },
  { '<leader>uT', group = 'Timer', icon = icon('󰔛', 'stopwatch') },
  {
    '<leader>uTs',
    rhs = function()
      require('neviraide-ui.utils.change_settings.timer').startTimer()
    end,
    desc = 'Start',
  },
  {
    '<leader>uTp',
    '<cmd>TimerPause<cr>',
    desc = 'Pause',
  },
  {
    '<leader>uTS',
    '<cmd>TimerStop<cr>',
    desc = 'Stop',
  },
}

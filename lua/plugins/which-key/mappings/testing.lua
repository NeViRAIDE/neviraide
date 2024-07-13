-- local icon = require('stigmata.utils').icon
local wk = require('which-key')

return function(bufnr)
  wk.add({
    { '<leader>T', group = 'Testing' },
    { '<leader>Ts', '<cmd>Neotest summary<cr>', desc = 'Summary' },
    { '<leader>Tr', '<cmd>Neotest run<cr>', desc = 'Run test' },
    {
      '<leader>TR',
      rhs = function()
        require('neotest').run.run()
        require('neotest').output.open({ enter = true, autoclose = true })
      end,
      desc = 'Run test and show result',
    },
    {
      '<leader>To',
      rhs = function()
        require('neotest').output.open({ enter = true, autoclose = true })
      end,
      desc = 'Output',
    },
    {
      '<leader>Tp',
      '<cmd>Neotest jump prev<cr>',
      desc = 'Go to previout test',
    },
    { '<leader>Tn', '<cmd>Neotest jump next<cr>', desc = 'Go to next test' },
    buffer = bufnr,
  })
end

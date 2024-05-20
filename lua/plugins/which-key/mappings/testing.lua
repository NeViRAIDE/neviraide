local icon = require('stigmata.utils').icon

return function(bufnr)
  require('neviraide.utils').wk_reg({
    ['<leader>'] = {
      T = {
        name = 'Testing',
        s = { ':Neotest summary<cr>', 'Summary' },
        r = { ':Neotest run<cr>', 'Run test' },
        R = {
          function()
            require('neotest').run.run()
            require('neotest').output.open({ enter = true, autoclose = true })
          end,
          'Run test and show result',
        },
        o = {
          function()
            require('neotest').output.open({ enter = true, autoclose = true })
          end,
          'Output',
        },
        p = { ':Neotest jump prev<cr>', 'Go to previout test' },
        n = { ':Neotest jump next<cr>', 'Go to next test' },
      },
    },
  })
end

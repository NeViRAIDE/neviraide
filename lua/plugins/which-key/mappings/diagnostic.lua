local wk = require('which-key')
local icon = require('neviraide-ui.icons.utils').icon

return function(client, bufnr)
  wk.register({
    ['<leader>'] = {
      d = {
        name = 'Diagnostics' .. icon('', 'pulse', 1),
        w = {
          ':Telescope diagnostics severity_bound=ERROR<cr>',
          'Workspace diagnostics',
        },
        l = {
          function()
            vim.diagnostic.open_float(nil, {
              focusable = true,
              border = vim.g.b,
            })
          end,
          'Show diagnostic on line',
        },
        p = {
          ':lua vim.diagnostic.goto_prev({float=false})<cr>',
          'Jump to previous diagnostic node',
        },
        n = {
          ':lua vim.diagnostic.goto_next({float=false})<cr>',
          'Jump to next diagnostic node',
        },
        d = {
          name = 'DAP',
          b = { ':DapToggleBreakpoint<cr>', 'Toggle breakpoint' },
          r = { ':DapContinue<cr>', 'Run debug' },
          t = { ':DapTerminate<cr>', 'Terminate DAP' },
          s = {
            name = 'steps',
            O = { ':DapStepOut<cr>', 'Out' },
            o = { ':DapStepOver<cr>', 'Over' },
            i = { ':DapStepInto<cr>', 'Into' },
          },
          L = {
            name = 'Set log level ',
            w = { ':DapSetLogLevel WARN<cr>', 'Warning' },
            i = { ':DapSetLogLevel INFO<cr>', 'Information' },
            d = { ':DapSetLogLevel DEBUG<cr>', 'Debug' },
            e = { ':DapSetLogLevel ERROR<cr>', 'Error' },
            t = { ':DapSetLogLevel TRACE<cr>', 'Trace' },
          },
          l = { ':DapShowLog<cr>', 'Show log' },
          R = { ':DapToggleRepl<cr>', 'Toggle REPL' },
        },
      },
    },
  }, { buffer = bufnr, mode = 'n' })
end

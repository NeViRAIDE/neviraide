local mappings =
    require('utils').load_mappings

local M = {}

M.attach_diagnostic = function(bufnr)
  mappings({
    ['<leader>'] = {
      d = {
        name = 'Diagnostics ',
        w = { ':Telescope diagnostics<cr>', 'Workspace diagnostics' },
        l = {
          ':lua vim.diagnostic.open_float()<cr>',
          'Show diagnostic on line',
        },
        p = {
          ':lua vim.diagnostic.goto_prev()<cr>',
          'Jump to previous diagnostic node',
        },
        n = {
          ':lua vim.diagnostic.goto_next()<cr>',
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
      }
    }
  }, { buffer = bufnr, mode = 'n' })
end

return M

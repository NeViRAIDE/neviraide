return function()
  dofile(vim.g.neviraide_themes_cache .. 'dap')

  local dap = require('dap')
  local dapui = require('dapui')

  dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

  vim.fn.sign_define('DapBreakpoint', {
    text = ' ',
    texthl = 'NotifyERRORIcon',
    linehl = 'NotifyERRORIcon',
    numhl = 'NotifyERRORIcon',
  })
  vim.fn.sign_define('DapBreakpointCondition', {
    text = ' ',
    texthl = 'NotifyTRACEIcon',
    linehl = 'NotifyTRACEIcon',
    numhl = 'NotifyTRACEIcon',
  })
  vim.fn.sign_define('DapLogPoint', {
    text = ' ',
    texthl = 'NotifyINFOIcon',
    linehl = 'NotifyINFOIcon',
    numhl = 'NotifyINFOIcon',
  })
  vim.fn.sign_define('DapStopped', {
    text = ' ',
    texthl = 'NotifyWARNIcon',
    linehl = 'NotifyWARNIcon',
    numhl = 'NotifyWARNIcon',
  })
end

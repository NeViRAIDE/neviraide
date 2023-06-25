return {
  'mfussenegger/nvim-dap',
  init = function()
    require("utils").lazy_load "nvim-dap"
  end,
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

    -- TODO: add icons for defferent modes
    vim.fn.sign_define('DapBreakpoint', {
      text = '🛑',
      texthl = 'DapUIStop',
      linehl = '',
      numhl = '',
    })
    vim.fn.sign_define(
      'DapBreakpointCondition',
      { text = '🔵', texthl = '', linehl = '', numhl = '' }
    )
    vim.fn.sign_define(
      'DapLogPoint',
      { text = '🟢', texthl = '', linehl = '', numhl = '' }
    )
    vim.fn.sign_define(
      'DapStopped',
      {
        text = '⏩',
        texthl = 'DapUIPlayPause',
        linehl = '',
        numhl = '',
      }
    )
  end,
  dependencies = {
    { 'theHamsta/nvim-dap-virtual-text', config = true },
    { 'rcarriga/nvim-dap-ui',            config = true },
    { 'leoluz/nvim-dap-go',              config = true },
  },
}

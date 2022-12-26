local M = {
  "mfussenegger/nvim-dap",
  event = "BufReadPre",
  dependencies = {
    { "theHamsta/nvim-dap-virtual-text", config = true },
    { "rcarriga/nvim-dap-ui", config = true },
    { 'leoluz/nvim-dap-go', config = true },
  }
}

function M.config()
  local dap = require("dap")
  local dapui = require("dapui")

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  vim.fn.sign_define(
    'DapBreakpoint',
    { text = '🛑', texthl = '', linehl = '', numhl = '' }
  )
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
    { text = '⏩', texthl = '', linehl = '', numhl = '' }
  )
end

return M

-- vim.notify = require('notify')

local async_load_plugin = nil
async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function()
  local notify = require('notify')
  notify.setup({
    timeout = 3000,
    fps = 60,
    icons = {
      DEBUG = '',
      ERROR = '',
      INFO = '',
      TRACE = '✎',
      WARN = '',
    },
    minimum_width = 10,
  })
  vim.notify = notify
  async_load_plugin:close()
end))
async_load_plugin:send()

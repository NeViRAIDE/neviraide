return function()
  -- when noice is not enabled, install notify on VeryLazy
  local util = require('neviraide.utils')
  if not util.has('noice.nvim') then
    -- util.on_very_lazy(function() vim.notify = require('notify') end)
    util.on_very_lazy(
      function() vim.notify = vim.schedule_wrap(require('notify')) end
    )
  end
end

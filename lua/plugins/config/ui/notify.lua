return {
  "rcarriga/nvim-notify",

  keys = {
    {
      "dn",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss all Notifications",
    },
  },

  opts = {
    timeout = 3000,
    fps = 60,
    minimum_width = 10,
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
  },

  init = function()
    -- when noice is not enabled, install notify on VeryLazy
    local Util = require("core.utils")
    if not Util.has("noice.nvim") then
      Util.on_very_lazy(function()
        vim.notify = require("notify")
      end)
    end
  end,
}

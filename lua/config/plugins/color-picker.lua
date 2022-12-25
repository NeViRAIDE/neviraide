local M = { "uga-rosa/ccc.nvim", event = "BufReadPre" }

function M.config()

  require('ccc').setup({
    highlighter = {
      auto_enable = true,
    }
  })
end

return M

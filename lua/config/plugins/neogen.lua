local M = {
  "danymat/neogen",
  event = "BufReadPre",
  dependencies = "nvim-treesitter/nvim-treesitter",
}

function M.config()
  require('neogen').setup {}
end

return M

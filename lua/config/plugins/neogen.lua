local M = {
  "danymat/neogen",
  event = "BufReadPre",
  dependensies = "nvim-treesitter/nvim-treesitter",
}

function M.config()
  require('neogen').setup {}
end

return M

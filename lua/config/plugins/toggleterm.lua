local M = {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy"
}

function M.config()
  require("toggleterm").setup()
end

return M

local M = {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy"
}

function M.config()
  require("toggleterm").setup({
    open_mapping = [[<c-\>]],
  })
end

return M

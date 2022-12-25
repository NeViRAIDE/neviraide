local M = {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
  branch = "v2.x",
  dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" }
}

function M.config()
  require("neo-tree").setup({
    default_component_configs = {
      git_status = {
        symbols = {
          added    = " ",
          modified = "柳",
          deleted  = " ",
        }
      },
    },
    close_if_last_window = true,
    filesystem = {
      use_libuv_file_watcher = false,
      follow_current_file = true,
      hijack_netrw_behavior = "open_current",
    },
  })
end

return M

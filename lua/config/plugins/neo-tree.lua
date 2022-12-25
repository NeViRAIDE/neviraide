local M = {
  "nvim-neo-tree/neo-tree.nvim",
  event = "VeryLazy",
  branch = "v2.x",
  dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" }
}

function M.config()
  require("neo-tree").setup({
    default_component_configs = {
      git_status = {
        symbols = {
          added    = " ",
          modified = " ",
          deleted  = " ",
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

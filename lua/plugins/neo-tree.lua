return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  config = function()
    require("neo-tree").setup({
      event_handlers = {
        {
          event = 'file_opened',
          handler = function(file_path) require('neo-tree').close_all() end,
        },
      },
    })
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  }
}

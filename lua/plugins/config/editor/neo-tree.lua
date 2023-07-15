return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  config = function()
    local fc = require("neo-tree.sources.filesystem.components")

    require("neo-tree").setup({
      -- close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      -- FIX: close on open
      -- event_handlers = {
      --   {
      --     event = 'file_opened',
      --     handler = function(file_path) require('neo-tree').close_all() end,
      --   },
      -- },

      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      filesystem = {
        components = {
          name = function(config, node, state)
            local result = fc.name(config, node, state)
            if node:get_depth() == 1 and node.type ~= "message" then
              result.text = vim.fn.fnamemodify(node.path, ":t")
            end
            return result
          end,
        },
        filtered_items = {
          always_show = { ".gitignore" },
        },
        use_libuv_file_watcher = true
      },
      nesting_rules = {
        ["js"] = { "js.map" },
      },
    })
  end,
}

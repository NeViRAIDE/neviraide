return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  init = function()
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("neo-tree")
      end
    end
  end,
  opts = function()
    local fc = require("neo-tree.sources.filesystem.components")
    return {
      event_handlers = {
        {
          event = 'file_opened',
          handler = function(file_path) require("neo-tree.command").execute({ action = "close" }) end,
        },
      },
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      default_component_configs = {
        git_status = {
          symbols = {
            added = ' ',
            modified = ' ',
            deleted = ' ',
          },
        },
        icon = {
          folder_closed = "",
          folder_open = '',
          folder_empty = '',
        },
        modified = {
          symbol = "",
        },
      },
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
    }
  end,
}

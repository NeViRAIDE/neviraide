-- TODO: open tree on open dir from :e
dofile(vim.g.neviraide_themes_cache .. 'neotree')

local icon = require('neviraide-ui.icons.utils').icon
local fc = require('neo-tree.sources.filesystem.components')

return {
  event_handlers = {
    {
      event = 'file_opened',
      handler = function()
        require('neo-tree.command').execute({ action = 'close' })
      end,
    },
  },
  sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols' },
  default_component_configs = {
    git_status = {
      symbols = {
        added = icon('', 'diff-added'),
        modified = icon('', 'diff-modified'),
        deleted = icon('', 'diff-removed'),
      },
    },
    icon = {
      folder_closed = icon('', 'file-directory-fill'),
      folder_open = icon('', 'file-directory-open-fill'),
      folder_empty = icon('', 'file-directory'),
    },
    modified = {
      symbol = icon('', 'pencil'),
    },
  },
  filesystem = {
    components = {
      name = function(config, node, state)
        local result = fc.name(config, node, state)
        if node:get_depth() == 1 and node.type ~= 'message' then
          result.text = vim.fn.fnamemodify(node.path, ':t')
        end
        return result
      end,
    },
    filtered_items = {
      always_show = { '.gitignore' },
    },
    use_libuv_file_watcher = true,
  },
  nesting_rules = {
    ['js'] = { 'js.map' },
  },
}

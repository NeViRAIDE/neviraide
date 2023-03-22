local M = {
  'nvim-neo-tree/neo-tree.nvim',
  event = 'VeryLazy',
  branch = 'v2.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
}

function M.config()
  local highlights = require('neo-tree.ui.highlights')

  vim.fn.sign_define(
    'DiagnosticSignError',
    { text = icon('x-circle', '', 'E'), texthl = 'DiagnosticSignError' }
  )
  vim.fn.sign_define(
    'DiagnosticSignWarn',
    { text = icon('alert', '', 'W'), texthl = 'DiagnosticSignWarn' }
  )
  vim.fn.sign_define(
    'DiagnosticSignInfo',
    { text = icon('info', '', 'I'), texthl = 'DiagnosticSignInfo' }
  )
  vim.fn.sign_define(
    'DiagnosticSignHint',
    { text = icon('light-bulb', '', 'H'), texthl = 'DiagnosticSignHint' }
  )

  require('neo-tree').setup({
    event_handlers = {
      {
        event = 'file_opened',
        handler = function(file_path) require('neo-tree').close_all() end,
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = icon('', '', '+'),
        expander_expanded = icon('', '', '-'),
        expander_highlight = 'NeoTreeExpander',
      },
      git_status = {
        symbols = {
          added = icon('diff-added', '', 'Added'),
          modified = icon('diff-modified', '', 'Modified'),
          deleted = icon('diff-removed', '', 'Removed'),
        },
      },
      icon = {
        folder_closed = icon('file-directory-fill', '📁', ''),
        folder_open = icon('file-directory-open-fill', '📂', ''),
        folder_empty = icon('file-directory', '', ''),
      },
    },
    filesystem = {
      filtered_items = {
        always_show = {
          '.gitignore',
        },
      },
      use_libuv_file_watcher = true,
      follow_current_file = true,
      hijack_netrw_behavior = 'open_current',
      -- FIX: make short root (only directory)

      -- components = {
      --   name = function(config, node, state)
      --     local highlight = config.highlight or highlights.FILE_NAME
      --     if node.type == 'directory' then
      --       highlight = highlights.DIRECTORY_NAME
      --     end
      --     if node:get_depth() == 1 then
      --       highlight = highlights.ROOT_NAME
      --       -- node.name = filePath('dir_only')
      --     else
      --       if
      --         config.use_git_status_colors == nil
      --         or config.use_git_status_colors
      --       then
      --         local git_status = state.components.git_status({}, node, state)
      --         if git_status and git_status.highlight then
      --           highlight = git_status.highlight
      --         end
      --       end
      --     end
      --     return {
      --       text = node.name,
      --       highlight = highlight,
      --     }
      --   end,
      -- },
    },
    nesting_rules = {
      ['js'] = { 'js.map' },
    },
  })
end

return M

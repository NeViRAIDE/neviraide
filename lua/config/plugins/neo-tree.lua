-- FIX: can't execute terminal command after open via neo-tree
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
    { text = icon('x-circle'), texthl = 'DiagnosticSignError' }
  )
  vim.fn.sign_define(
    'DiagnosticSignWarn',
    { text = icon('alert'), texthl = 'DiagnosticSignWarn' }
  )
  vim.fn.sign_define(
    'DiagnosticSignInfo',
    { text = icon('info'), texthl = 'DiagnosticSignInfo' }
  )
  vim.fn.sign_define(
    'DiagnosticSignHint',
    { text = icon('light-bulb'), texthl = 'DiagnosticSignHint' }
  )

  require('neo-tree').setup({
    event_handlers = {
      {
        event = 'file_opened',
        handler = function(file_path) require('neo-tree').close_all() end,
      },
    },
    default_component_configs = {
      git_status = {
        symbols = {
          added = icon('diff-added'),
          modified = icon('diff-modified'),
          deleted = icon('diff-removed'),
        },
      },
    },
    -- close_if_last_window = true,
    filesystem = {
      use_libuv_file_watcher = true,
      follow_current_file = true,
      hijack_netrw_behavior = 'open_current',
      -- TODO: change directory icons

      -- components = {
      --   icon = function(config, node, state)
      --     local icon = config.default or ' '
      --     local padding = config.padding or ' '
      --     local highlight = config.highlight or highlights.FILE_ICON
      --
      --     if node.type == 'directory' then
      --       highlight = highlights.DIRECTORY_ICON
      --       if node.loaded and not node:has_children() then
      --         icon = icon('file-directory') or config.default
      --       elseif node:is_expanded() then
      --         icon = icon('file-directory-open-fill') or config.default
      --       else
      --         icon = icon('file-directory-fill') or config.default
      --       end
      --     elseif node.type == 'file' then
      --       local success, web_devicons = pcall(require, 'nvim-web-devicons')
      --       if success then
      --         local devicon, hl = web_devicons.get_icon(node.name, node.ext)
      --         icon = devicon or icon
      --         highlight = hl or highlight
      --       end
      --     end
      --
      --     return {
      --       text = icon .. padding,
      --       highlight = highlight,
      --     }
      --   end,
      -- },
    },
  })
end

return M

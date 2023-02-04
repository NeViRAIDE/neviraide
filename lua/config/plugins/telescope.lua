local M = {
  'nvim-telescope/telescope.nvim',
  version = '0.1.0',
  event = 'VeryLazy',
  dependencies = {
    'nvim-telescope/telescope-symbols.nvim',
  },
}
function M.config()
  local telescope = require('telescope')
  local action = require('telescope.actions')
  local action_layout = require('telescope.actions.layout')

  local function extension(extension_name)
    return telescope.load_extension(extension_name)
  end

  telescope.setup({
    pickers = {
      buffers = {
        theme = 'dropdown',
        initial_mode = 'normal',
        previewer = false,
        sort_lastused = true,
        layout_config = {
          height = 0.3,
          width = 0.5,
        },
      },
      find_files = {
        layout_strategy = 'horizontal',
        layout_config = {
          height = 0.8,
          width = 0.9,
          prompt_position = 'top',
          preview_width = 0.6,
          scroll_speed = 2,
        },
        find_command = { 'fdfind', '--type', 'f', '--strip-cwd-prefix' },
      },
      live_grep = {
        layout_strategy = 'horizontal',
        layout_config = {
          width = 0.8,
          height = 0.5,
          prompt_position = 'top',
          preview_width = 0.5,
          scroll_speed = 2,
        },
      },
      oldfiles = {
        initial_mode = 'normal',
        previewer = false,
        theme = 'dropdown',
        layout_config = {
          width = 0.6,
          height = 0.3,
        },
      },
      help_tags = {
        layout_strategy = 'horizontal',
        layout_config = {
          height = 0.9,
          width = 0.9,
          prompt_position = 'top',
          scroll_speed = 2,
          preview_width = 0.7,
        },
      },
      man_pages = {
        layout_strategy = 'vertical',
        layout_config = {
          height = 0.8,
          prompt_position = 'top',
          preview_height = 0.8,
          mirror = true,
          scroll_speed = 2,
        },
      },
      lsp_document_symbols = {
        initial_mode = 'normal',
        previewer = false,
        theme = 'dropdown',
        layout_config = {
          height = 0.9,
          width = 0.38,
        },
      },
      lsp_references = {
        initial_mode = 'normal',
        theme = 'ivy',
        layout_config = {
          bottom_pane = { height = 12 },
          preview_width = 0.4,
        },
      },
      diagnostics = {
        initial_mode = 'normal',
        theme = 'ivy',
        previewer = false,
        layout_config = {
          bottom_pane = { height = 12 },
        },
      },
    },
    defaults = {
      prompt_prefix = ' ' .. icon('search', ' 🔎 ', '  ') .. ' ',
      selection_caret = icon('arrow-right', '👉', '> ') .. ' ',
      dynamic_preview_title = true,
      use_less = true,
      mappings = {
        i = {
          ['<C-j>'] = 'preview_scrolling_down',
          ['<C-k>'] = 'preview_scrolling_up',
          ['<C-q>'] = action.close,
          ['<M-p>'] = action_layout.toggle_preview,
          ['<C-u>'] = false,
        },
        n = {
          ['<C-j>'] = 'preview_scrolling_down',
          ['<C-k>'] = 'preview_scrolling_up',
          ['<C-q>'] = action.close,
          ['<M-p>'] = action_layout.toggle_preview,
          q = action.close,
        },
      },
    },
  })

  extension('todo-comments')
  extension('notify')
  extension('noice')
end

return M

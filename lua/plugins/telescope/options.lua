return function()
  dofile(vim.g.ntc .. 'telescope')

  ---@type table
  local border = load('return ' .. NEVIRAIDE().borderchars)()

  local icon = require('neviraide.ui.neviraide-ui.icons.utils').icon

  local action = require('telescope.actions')
  local action_layout = require('telescope.actions.layout')
  local sorters = require('telescope.sorters')
  local previewers = require('telescope.previewers')

  return {
    pickers = {
      find_files = {
        layout_strategy = 'horizontal',
        layout_config = {
          height = 0.8,
          width = 0.9,
          prompt_position = 'top',
          preview_width = 0.6,
          scroll_speed = 2,
        },
        borderchars = border,
        find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' },
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
        borderchars = border,
      },
      oldfiles = {
        initial_mode = 'normal',
        previewer = false,
        theme = 'dropdown',
        layout_config = {
          width = 0.6,
          height = 14,
        },
        borderchars = border,
      },
      help_tags = {
        layout_strategy = 'horizontal',
        layout_config = {
          height = 0.9,
          width = 0.9,
          prompt_position = 'top',
          scroll_speed = 2,
          preview_width = 0.6,
        },
        borderchars = border,
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
        borderchars = border,
      },
      lsp_references = {
        initial_mode = 'normal',
        theme = 'ivy',
        layout_config = {
          bottom_pane = { height = 12 },
          preview_width = 0.4,
        },
        borderchars = border,
      },
      diagnostics = {
        initial_mode = 'normal',
        theme = 'ivy',
        previewer = false,
        layout_config = {
          bottom_pane = { height = 12 },
        },
        borderchars = border,
      },
    },
    defaults = {
      vimgrep_arguments = {
        'rg',
        '-L',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
      },
      prompt_prefix = icon('', 'search', 1, 2),
      selection_caret = icon('', 'triangle-right', 0, 1),
      entry_prefix = '  ',
      initial_mode = 'insert',
      selection_strategy = 'reset',
      sorting_strategy = 'ascending',
      layout_strategy = 'horizontal',
      layout_config = {
        horizontal = {
          prompt_position = 'top',
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      file_sorter = sorters.get_fuzzy_file,
      file_ignore_patterns = { 'node_modules' },
      generic_sorter = sorters.get_generic_fuzzy_sorter,
      path_display = { 'truncate' },
      winblend = vim.g.blend,
      borderchars = border,
      color_devicons = true,
      set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
      file_previewer = previewers.vim_buffer_cat.new,
      grep_previewer = previewers.vim_buffer_vimgrep.new,
      qflist_previewer = previewers.vim_buffer_qflist.new,
      buffer_previewer_maker = previewers.buffer_previewer_maker,
      dynamic_preview_title = true,
      mappings = {
        i = {
          ['<C-j>'] = 'preview_scrolling_down',
          ['<C-k>'] = 'preview_scrolling_up',
          ['<C-q>'] = action.close,
          ['<M-p>'] = action_layout.toggle_preview,
          ['<C-u>'] = false,
          ['<C-d>'] = action.delete_buffer + action.move_to_top,
        },
        n = {
          q = action.close,
          ['<C-j>'] = 'preview_scrolling_down',
          ['<C-k>'] = 'preview_scrolling_up',
          ['<C-q>'] = action.close,
          ['<M-p>'] = action_layout.toggle_preview,
          ['<C-d>'] = action.delete_buffer + action.move_to_top,
        },
      },
    },
    extensions_list = {
      'todo-comments', --[[ 'notify' ]]
    },
  }
end

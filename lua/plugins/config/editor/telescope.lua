return {
  "nvim-telescope/telescope.nvim",

  dependencies = { "nvim-treesitter/nvim-treesitter" },

  cmd = "Telescope",

  opts = function()
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
        },
        oldfiles = {
          initial_mode = 'normal',
          previewer = false,
          theme = 'dropdown',
          layout_config = {
            width = 0.6,
            height = 14,
          },
          border = {},
          borderchars = { "", "", "", "", "", "", "", "" },
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
        lsp_references = {
          initial_mode = 'normal',
          theme = 'ivy',
          layout_config = {
            bottom_pane = { height = 12 },
            preview_width = 0.4,
          },
          border = {},
          borderchars = { "", "", "", "", "", "", "", "" },
        },
        diagnostics = {
          initial_mode = 'normal',
          theme = 'ivy',
          previewer = false,
          layout_config = {
            bottom_pane = { height = 12 },
          },
          border = {},
          borderchars = { "", "", "", "", "", "", "", "" },
        },
      },
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
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
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "", "", "", "", "", "", "", "" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
      },

      extensions_list = { "todo-comments", "notify" },
    }
  end,

  config = function(_, opts)
    local telescope = require "telescope"
    telescope.setup(opts)

    for _, ext in ipairs(opts.extensions_list) do
      telescope.load_extension(ext)
    end
  end,
}

local telescope = require("telescope")
local themes = require("telescope.themes")
local telescope_actions = require("telescope.actions.set")

telescope.setup({
    pickers = {
        buffers = {
            theme = "dropdown",
            initial_mode = 'normal',
            previewer = false,
            sort_lastused = true,
            layout_config = {
                height = 0.3,
                width = 0.4,
            },
        },
        file_browser = {
            attach_mappings = function(_)
                telescope_actions.select:enhance({
                    post = function()
                        vim.cmd(":normal! zX")
                    end,
                })
                return true
            end,
        },
        find_files = {
            attach_mappings = function(_)
                telescope_actions.select:enhance({
                    post = function()
                        vim.cmd(":normal! zX")
                    end,
                })
                return true
            end,
            layout_strategy = "horizontal",
            layout_config = {
                height = 0.8,
                width = 0.9,
                prompt_position = "top",
                preview_width = 0.6,
                scroll_speed = 2,
            },
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
        },
        live_grep = {
            attach_mappings = function(_)
                telescope_actions.select:enhance({
                    post = function()
                        vim.cmd(":normal! zX")
                    end,
                })
                return true
            end,
            layout_strategy = "horizontal",
            layout_config = {
                width = 0.8,
                height = 0.5,
                prompt_position = "top",
                preview_width = 0.5,
                scroll_speed = 2,
            }
        },
        oldfiles = {
            initial_mode = 'normal',
            attach_mappings = function(_)
                telescope_actions.select:enhance({
                    post = function()
                        vim.cmd(":normal! zX")
                    end,
                })
                return true
            end,
            previewer = false,
            theme = "dropdown",
            layout_config = {
                width = 0.6,
                height = 0.3,
            }
        },
        help_tags = {
            layout_strategy = "horizontal",
            layout_config = {
                height = 0.9,
                width = 0.9,
                prompt_position = "top",
                scroll_speed = 2,
                preview_width = 0.7,
            },
        },
        man_pages = {
            layout_strategy = "vertical",
            layout_config = {
                height = 0.8,
                prompt_position = "top",
                preview_height = 0.8,
                mirror = true,
                scroll_speed = 2
            },
        },
        lsp_document_symbols = {
            initial_mode = "normal",
            previewer = false,
            theme = "dropdown",
            layout_config = {
                height = 0.9,
                width = 0.38
            },
        },
        lsp_references = {
            initial_mode = "normal",
            theme = "ivy",
            layout_config = {
                bottom_pane = { height = 12 },
                preview_width = 0.4,
            },
        },
        diagnostics = {
            initial_mode = "normal",
            theme = "ivy",
            previewer = false,
            layout_config = {
                bottom_pane = { height = 12 },
            },
        },
    },
    defaults = {
        prompt_prefix = " 🔍 ",
        selection_caret = "➤ ",
        dynamic_preview_title = true,
        use_less = true,
        mappings = {
            i = {
                ["<C-j>"] = "preview_scrolling_down",
                ["<C-k>"] = "preview_scrolling_up",
            },
            n = {
                ["<C-j>"] = "preview_scrolling_down",
                ["<C-k>"] = "preview_scrolling_up",
            },
        }
    },
    extensions = {
        ["ui-select"] = {
            themes.get_cursor {}
        },
        project = {
            initial_mode = 'normal',
            preview = {
                disable = false, -- default
                dir_only = false, -- default
                additional_readmes = { "notes.md", "notes.txt", "README.md", "readme.md" } -- not default
            },
            base_dirs = {
                '~/.config/',
                '~/projects',
            },
            hidden_files = false,
            theme = "dropdown",
        },
        file_browser = {
            theme = "dropdown",
            previewer = false,
            layout_config = {
                height = 0.9,
                width = 0.4,
                prompt_position = "top",
            },
            initial_mode = 'normal',
            hijack_netrw = true,
        },
    },
})

telescope.load_extension 'project'
-- TODO: change to file browser tree
telescope.load_extension "file_browser"
telescope.load_extension("ui-select")
telescope.load_extension("todo-comments")

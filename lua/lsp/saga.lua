local saga = require("lspsaga")
saga.init_lsp_saga({
    border_style = "rounded",
    saga_winblend = 20,
    move_in_saga = { prev = '<C-p>', next = '<C-n>' },
    diagnostic_header = { " ", " ", " ", "ﴞ " },
    show_diagnostic_source = true,
    diagnostic_source_bracket = {},
    max_preview_lines = 10,
    code_action_icon = "🪄",
    code_action_num_shortcut = true,
    code_action_lightbulb = {
        enable = true,
        sign = true,
        enable_in_insert = false,
        sign_priority = 20,
        virtual_text = false,
    },
    finder_icons = {
        def = '  ',
        ref = '諭 ',
        link = '  ',
    },
    finder_request_timeout = 1500,
    finder_action_keys = {
        open = "o",
        vsplit = "v",
        split = "s",
        tabe = "t",
        quit = "q",
        scroll_down = "<C-j>",
        scroll_up = "<C-k>", -- quit can be a table
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    rename_action_quit = "<C-c>",
    rename_in_select = true,
    definition_preview_icon = "  ",
    symbol_in_winbar = {
        in_custom = true,
        enable = true,
        separator = '  ',
        show_file = true,
        click_support = function(node, clicks, button, modifiers)
            local st = node.range.start
            local en = node.range['end']
            if button == "l" then
                if clicks == 2 then
                else
                    vim.fn.cursor(st.line + 1, st.character + 1)
                end
            elseif button == "r" then
                if modifiers == "s" then
                    print "lspsaga"
                end
                vim.fn.cursor(en.line + 1, en.character + 1)
            elseif button == "m" then
                vim.fn.cursor(st.line + 1, st.character + 1)
                vim.cmd "normal v"
                vim.fn.cursor(en.line + 1, en.character + 1)
            end
        end
    },
    show_outline = {
        win_position = 'right',
        win_with = '',
        win_width = 30,
        auto_enter = true,
        auto_preview = true,
        virt_text = '┃',
        jump_key = 'o',
        auto_refresh = true,
    },
    server_filetype_map = {},
})

local action = require("lspsaga.action")
vim.keymap.set("n", "<C-k>", function()
    action.smart_scroll_with_saga(1)
end, { silent = true })
vim.keymap.set("n", "<C-j>", function()
    action.smart_scroll_with_saga(-1)
end, { silent = true })

local wk = require 'which-key'
wk.setup {
    plugins = {
        marks = true,
        registers = true,
        spelling = { enabled = false, suggestions = 20 },
        presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },
    operators = { gc = 'Comments' },
    key_labels = {
        ['<leader>'] = "Space",
        ['<space>'] = 'SPACE',
        ['<cr>'] = 'Enter',
        ['<tab>'] = 'TAB',
        ['<c>'] = "Ctrl",
    },
    icons = { breadcrumb = '»', separator = '➜', group = '+' },
    popup_mappings = { scroll_down = '<c-j>', scroll_up = '<c-k>' },
    window = {
        border = 'rounded',
        position = 'bottom',
        margin = { 1, 6, 1, 6 },
        padding = { 2, 2, 2, 2 },
        winblend = 10,
    },
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 13,
        align = 'center',
    },
    ignore_missing = false,
    hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' },
    show_help = true,
    triggers = 'auto',
    triggers_blacklist = { i = { 'j', 'k' }, v = { 'j', 'k' } },
}
wk.register {
    ['<leader>'] = {
        name = 'leader key actions',
        g = { '<cmd>Neogit<cr>', 'Git ' },
        s = { '<cmd>wa<cr>', 'Save all opened files' },
        f = { '<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format file' },
        b = { ':NvimTreeToggle<cr>', 'File browser' },
        k = { ':WhichKey<cr>', 'Keybindings' },
        p = {
            name = "Python",
            r = { '<cmd>!python %<cr>', 'Run code' }
        },
        c = {
            name = 'Create TODO comments',
            f = { 'OFIX:<esc><cmd>CommentToggle<cr>A ', 'perhaps i have a bug...' },
            t = {
                'OTODO:<esc><cmd>CommentToggle<cr>A ',
                'i have to do this next time...',
            },
            h = { 'OHACK:<esc><cmd>CommentToggle<cr>A ', 'i need to hack this...' },
            w = { 'OWARN:<esc><cmd>CommentToggle<cr>A ', 'i need to warn this...' },
            p = {
                'OPERF:<esc><cmd>CommentToggle<cr>A ',
                'this part can be better...',
            },
            n = {
                'ONOTE:<esc><cmd>CommentToggle<cr>A ',
                'i should remember about this...',
            },
        },
        t = {
            name = 'Telescope',
            p = {
                "<cmd>lua require('telescope.builtin').pickers()<cr>",
                'Pickers',
            },
            e = {
                "<cmd>lua require('telescope.builtin').registers()<cr>",
                'Registers',
            },
            m = {
                "<cmd>lua require('telescope.builtin').man_pages()<cr>",
                'Manual pages',
            },
            r = {
                "<cmd>lua require('telescope.builtin').oldfiles()<cr>",
                'Recent files',
            },
            b = {
                "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({initial_mode='normal',previewer=false,sort_lastused=true}))<cr>",
                'Show open buffers',
            },
            f = {
                "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer = false}))<cr>",
                'Find files',
            },
            w = {
                "<cmd>lua require('telescope.builtin').live_grep()<cr>",
                'Find word',
            },
            h = {
                "<cmd>lua require('telescope.builtin').help_tags()<cr>",
                'Help tags',
            },
            t = { "<cmd>lua require('telescope.builtin').tags()<cr>", 'Tags' },
            s = {
                "<cmd>lua require('telescope.builtin').grep_string()<cr>",
                'Find string',
            },
            o = {
                "<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<cr>",
                'Tags (only current buffers)',
            },
        },
        d = {
            name = 'Diagnostics',
            w = {
                ":lua require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy({initial_mode = 'normal', previewer = false, layout_config = {bottom_pane = {height = 12}}}))<cr>",
                'workspace diagnostics',
            },
            s = {
                '<cmd>lua vim.diagnostic.open_float()<cr>',
                'show diagnostic line',
            },
            p = {
                '<cmd>lua vim.diagnostic.goto_prev()<cr>',
                'jump to previous diagnostic line',
            },
            n = {
                '<cmd>lua vim.diagnostic.goto_next()<cr>',
                'jump to next diagnostic line',
            },
        },
        l = {
            name = 'LSP',
            h = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover' },
            r = {
                ":lua require('telescope.builtin').lsp_references(require('telescope.themes').get_ivy({initial_mode = 'normal', previewer = false, layout_config = {bottom_pane = {height = 12}}}))<cr>",
                'References',
            },
            c = {
                '<cmd>lua vim.lsp.buf.code_action()<cr>',
                'Code actions',
            },
            n = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'New name' },
            i = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Implementation' },
            d = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Declaration' },
            p = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Type definition' },
            s = { '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Signature help' },
        },
    },
}

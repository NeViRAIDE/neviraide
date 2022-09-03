local colors = require("catppuccin.palettes").get_palette()
colors.none = 'NONE'
require("catppuccin").setup({
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 1
    },
    transparent_background = false,
    -- term_colors = true,
    compile = {
        enabled = true,
        path = vim.fn.stdpath "cache" .. "/catppuccin",
    },
    styles = {
        comments = {},
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = { 'italic', 'bold' },
        strings = { "italic" },
        variables = {},
        numbers = {},
        booleans = { 'bold' },
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        -- treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = {},
                hints = {},
                warnings = {},
                information = {},
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
        -- cmp = true,
        -- lsp_saga = true,
        gitsigns = true,
        telescope = true,
        dap = {
            enabled = true,
            enable_ui = true,
        },
        which_key = true,
        -- indent_blankline = {
        --     enabled = true,
        --     colored_indent_levels = true,
        -- },
        dashboard = true,
        -- vim_sneak = false,
        -- fern = false,
        -- barbar = false,
        -- bufferline = true,
        markdown = true,
        lightspeed = true,
        -- ts_rainbow = true,
        -- hop = false,
        -- notify = true,
        -- telekasten = true,
        -- symbols_outline = true,
        -- mini = false,
        -- aerial = false,
        -- vimwiki = true,
        -- beacon = true,
        -- navic = false,
        -- overseer = false,
    },
    color_overrides = {},
    highlight_overrides = {
        all = {
            NormalFloat = { bg = colors.none },
            LspSignatureActiveParameter = { fg = "LightGreen", style = { "bold" } },
            Folded = { fg = colors.mauve, bg = colors.none },
            FloatBorder = { bg = colors.none },
            DiagnosticFloatingError = { bg = colors.none },
            DiagnosticFloatingWarn = { bg = colors.none },
            DiagnosticFloatingInfo = { bg = colors.none },
            DiagnosticFloatingHint = { bg = colors.none },
        }
    }
})

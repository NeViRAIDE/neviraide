require("nvim-gps").setup()
local gps = require("nvim-gps")
gps.is_available() -- Returns boolean value indicating whether a output can be provided
gps.get_location() -- Returns a string with context information

local status, lualine = pcall(require, "lualine")
if (not status) then return end
local colors = {
    yellow = '#ECBE7B',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#98be65',
    orange = '#FF8800',
    violet = '#a9a1e1',
    magenta = '#c678dd',
    blue = '#51afef',
    red = '#ec5f67'
}

local config = {
    options = {
        icons_enabled = true,
        theme = "onedark",
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename', 'filesize'},
        lualine_c = {{gps.get_location, condition = gps.is_available}},
        lualine_x = {
            {
                "diagnostics",
                sources = {"nvim_diagnostic"},
                symbols = {
                    error = " ",
                    warn = " ",
                    info = " ",
                    hint = " "
                }
            }, "filetype", "fileformat", "encoding"
        },
        lualine_y = {'branch'},
        lualine_z = {"location", "progress"}

    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {"fugitive", "nvim-tree", 'fzf', 'toggleterm', 'quickfix'}
}

local function insert(component)
    table.insert(config.sections.lualine_c, component)
end

insert {
    'lsp_progress',
    colors = {
        percentage = colors.cyan,
        title = colors.cyan,
        message = colors.cyan,
        spinner = colors.cyan,
        lsp_client_name = colors.magenta,
        use = true
    },
    separators = {
        component = ' ',
        progress = ' | ',
        percentage = {pre = '', post = '%% '},
        title = {pre = '', post = ': '},
        lsp_client_name = {pre = '[', post = ']'},
        spinner = {pre = '', post = ''},
        message = {
            pre = '(',
            post = ')',
            commenced = 'In Progress',
            completed = 'Completed'
        }
    },
    display_components = {
        'lsp_client_name', 'spinner', {'title', 'percentage', 'message'}
    },
    timer = {
        progress_enddelay = 500,
        spinner = 1000,
        lsp_client_name_enddelay = 1000
    },
    spinner_symbols = {
        '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 '
    }
}

lualine.setup(config)


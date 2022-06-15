local lualine = require('lualine')

local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local config = {
    disabled_filetypes = { 'Telescope' },
    extensions = {
        "quickfix", "nvim-tree", "toggleterm"
    },
    tabline = {
        lualine_a = { 'buffers' },
        lualine_z = { 'tabs' }
    },
    options = {
        component_separators = '',
        section_separators = '',
        theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left {
    function()
        return '▊'
    end,
    color = { fg = colors.green }, -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
    function()
        return ''
    end,
    color = function()
        local mode_color = {
            n = colors.green,
            i = colors.blue,
            v = colors.magenta,
            [''] = colors.magenta,
            V = colors.magenta,
            c = colors.yellow,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { right = 1 },
}

ins_left {
    'filesize',
    cond = conditions.buffer_not_empty,
}

ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.magenta, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
    },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
    function()
        return '%='
    end,
}

ins_left {
    -- Lsp server name .
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' LSP:',
    color = { fg = '#ffffff', gui = 'bold' },
}

-- Add components to right sections
ins_right {
    'o:encoding', -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = 'bold' },
}

ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.green, gui = 'bold' },
}

ins_right {
    'branch',
    icon = '',
    color = { fg = colors.orange, gui = 'bold' },
}

ins_right {
    'diff',
    symbols = { added = ' ', modified = '柳 ', removed = ' ' },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.blue },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
}

ins_right {
    function()
        return '▊'
    end,
    color = { fg = colors.green },
    padding = { left = 1 },
}

lualine.setup(config)
--------------------------------------------------------------------
-- local function window()
--     return vim.api.nvim_win_get_number(0)
-- end
--
-- local function keymap()
--     if vim.opt.iminsert:get() > 0 and vim.b.keymap_name then
--         return '⌨ ' .. vim.b.keymap_name
--     end
--     return ''
-- end
--
-- local custom_fname = require('lualine.components.filename'):extend()
-- local highlight = require 'lualine.highlight'
-- local default_status_colors = { saved = '#228B22', modified = '#C70039' }
--
-- function custom_fname:init(options)
--     custom_fname.super.init(self, options)
--     self.status_colors = {
--         saved = highlight.create_component_highlight_group(
--             { bg = default_status_colors.saved }, 'filename_status_saved', self.options),
--         modified = highlight.create_component_highlight_group(
--             { bg = default_status_colors.modified }, 'filename_status_modified', self.options),
--     }
--     if self.options.color == nil then self.options.color = '' end
-- end
--
-- function custom_fname:update_status()
--     local data = custom_fname.super.update_status(self)
--     data = highlight.component_format_highlight(vim.bo.modified
--         and self.status_colors.modified
--         or self.status_colors.saved) .. data
--     return data
-- end
--
-- require("lualine").setup({
--     extensions = {
--         'nvim-tree', 'toggleterm'
--     },
--     tabline = {
--         lualine_a = { 'buffers' },
--         lualine_b = {},
--         lualine_c = {},
--         lualine_x = {},
--         lualine_y = {},
--         lualine_z = { 'tabs' }
--     },
--     lualine_a = { window },
--     lualine_b = { { 'b:gitsigns_head', icon = '' }, },
--     lualine_c = { custom_fname, keymap },
-- })

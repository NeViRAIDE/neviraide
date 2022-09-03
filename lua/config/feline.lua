local ctp_feline = require('catppuccin.groups.integrations.feline')
ctp_feline.setup({})
local catppuccin_palette = require('catppuccin.palettes').get_palette()
local colors = {
    bg = catppuccin_palette.mantle,
    fg = catppuccin_palette.text,
    rosewater = catppuccin_palette.rosewater,
    flamingo = catppuccin_palette.flamingo,
    pink = catppuccin_palette.pink,
    mauve = catppuccin_palette.mauve,
    red = catppuccin_palette.red,
    maroon = catppuccin_palette.maroon,
    peach = catppuccin_palette.peach,
    yellow = catppuccin_palette.yellow,
    green = catppuccin_palette.green,
    teal = catppuccin_palette.teal,
    sky = catppuccin_palette.sky,
    sapphire = catppuccin_palette.sapphire,
    blue = catppuccin_palette.blue,
    lavender = catppuccin_palette.lavender,
    none = 'NONE'
}
local vi_mode_colors = {
    ['NORMAL'] = colors.maroon,
    ['INSERT'] = colors.sky,
    ['VISUAL'] = colors.sapphire,
    ['OP'] = colors.maroon,
    ['BLOCK'] = colors.sky,
    ['REPLACE'] = colors.flamingo,
    ['V-REPLACE'] = colors.flamingo,
    ['ENTER'] = colors.lavender,
    ['MORE'] = colors.lavender,
    ['SELECT'] = colors.peach,
    ['COMMAND'] = colors.yellow,
    ['SHELL'] = colors.maroon,
    ['TERM'] = colors.sky,
    ['NONE'] = colors.yellow
}

local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')
local cursor = require('feline.providers.cursor')
local components = {
    active = { {}, {}, {} },
    inactive = { {}, {} }
}
-- Vim Mode
table.insert(components.active[1], {
    provider = function()
        return ' ' .. vi_mode_utils.get_vim_mode() .. ' '
    end,
    hl = function()
        local val = {}

        val.fg = vi_mode_utils.get_mode_color()
        val.style = 'bold'

        return val
    end,
    right_sep = ' '
})
-- Git Branch
table.insert(components.active[1], {
    provider = 'git_branch',
    icon = ' ',
    hl = {
        fg = colors.peach,
    },
    left_sep = ' ',
})
-- File
table.insert(components.active[1], {
    provider = {
        name = 'file_size',
        -- opts = {
        --     type = 'short',
        --     file_readonly_icon = '',
        --     file_modified_icon = '',
        -- }
    },
    hl = {
        fg = colors.lavender,
    },
    left_sep = ' ',
})
table.insert(components.active[1], {
    provider = 'diagnostic_errors',
    enabled = function() return lsp.diagnostics_exist('Error') end,
    hl = {
        fg = colors.red,
    },
    -- left_sep = ' ',
})
table.insert(components.active[1], {
    provider = 'diagnostic_warnings',
    enabled = function() return lsp.diagnostics_exist('Warn') end,
    hl = {
        fg = colors.yellow,
    },
    -- left_sep = ' ',
})
table.insert(components.active[1], {
    provider = 'diagnostic_info',
    enabled = function() return lsp.diagnostics_exist('Info') end,
    hl = {
        fg = colors.green,
    },
    -- left_sep = ' ',
})
table.insert(components.active[1], {
    provider = 'diagnostic_hints',
    enabled = function() return lsp.diagnostics_exist('Error') end,
    hl = {
        fg = colors.red,
    },
    -- left_sep = ' ',
})
-- Lsp Server Name
table.insert(components.active[3], {
    provider = 'lsp_client_names',
    icon = '  ',
    hl = {
        fg = colors.yellow,
        bd = colors.none
    },
    right_sep = ' ',
    left_sep = '  ',
})
table.insert(components.active[3], {
    provider = 'line_percentage',
    hl = {
        fg = colors.blue,
    },
    right_sep = ' ',
})
table.insert(components.active[3], {
    provider = {
        name = 'position',
    },
    hl = function()
        local val = {}

        val.fg = vi_mode_utils.get_mode_color()

        return val
    end,
    right_sep = ' ',
})
table.insert(components.inactive[1], {
    provider = {
        name = 'file_info',
        opts = {
            type = 'short',
            file_readonly_icon = '',
            file_modified_icon = '',
        }
    },
    hl = {
        fg = colors.lavender,
    },
    left_sep = ' ',
})
table.insert(components.inactive[2], {
    provider = {
        name = 'position',
    },
    hl = function()
        local val = {}

        val.fg = vi_mode_utils.get_mode_color()

        return val
    end,
    right_sep = ' ',
})
require('feline').setup({
    default_bg = colors.none,
    components = components,
    -- components = ctp_feline.get(),
    vi_mode_colors = vi_mode_colors,
})
-- require("feline").setup({
-- components = ctp_feline.get(),
-- })
-- local function file_osinfo()
--     local os = vim.bo.fileformat:upper()
--     local icon
--     if os == 'UNIX' then
--         icon = ' '
--     elseif os == 'MAC' then
--         icon = ' '
--     else
--         icon = ' '
--     end
--     return icon .. os
-- end
--
-- local lsp = require 'feline.providers.lsp'
-- local vi_mode_utils = require 'feline.providers.vi_mode'
--
-- -- local lsp_get_diag = function(str)
-- --   local count = vim.lsp.diagnostic.get_count(0, str)
-- --   return (count > 0) and ' '..count..' ' or ''
-- -- end
--
-- -- LuaFormatter off
--
-- local comps = {
--     vi_mode = {
--         left = {
--             provider = function()
--               return '  ' .. vi_mode_utils.get_vim_mode()
--             end,
--             hl = function()
--                 local val = {
--                     name = vi_mode_utils.get_mode_highlight_name(),
--                     fg = vi_mode_utils.get_mode_color(),
--                     -- fg = colors.bg
--                 }
--                 return val
--             end,
--             right_sep = ' '
--         },
--         right = {
--             -- provider = '▊',
--             provider = '' ,
--             hl = function()
--                 local val = {
--                     name = vi_mode_utils.get_mode_highlight_name(),
--                     fg = vi_mode_utils.get_mode_color()
--                 }
--                 return val
--             end,
--             left_sep = ' ',
--             right_sep = ' '
--         }
--     },
--     file = {
--         info = {
--             provider = {
--               name = 'file_info',
--               opts = {
--                 type = 'relative-short',
--                 file_readonly_icon = '  ',
--                 -- file_readonly_icon = '  ',
--                 -- file_readonly_icon = '  ',
--                 -- file_readonly_icon = '  ',
--                 -- file_modified_icon = '',
--                 file_modified_icon = '',
--                 -- file_modified_icon = 'ﱐ',
--                 -- file_modified_icon = '',
--                 -- file_modified_icon = '',
--                 -- file_modified_icon = '',
--               }
--             },
--             hl = {
--                 fg = colors.blue,
--                 style = 'bold'
--             }
--         },
--         encoding = {
--             provider = 'file_encoding',
--             left_sep = ' ',
--             hl = {
--                 fg = colors.violet,
--                 style = 'bold'
--             }
--         },
--         type = {
--             provider = 'file_type'
--         },
--         os = {
--             provider = file_osinfo,
--             left_sep = ' ',
--             hl = {
--                 fg = colors.violet,
--                 style = 'bold'
--             }
--         },
--         position = {
--             provider = 'position',
--             left_sep = ' ',
--             hl = {
--                 fg = colors.cyan,
--                 -- style = 'bold'
--             }
--         },
--     },
--     left_end = {
--         provider = function() return '' end,
--         hl = {
--             fg = colors.bg,
--             bg = colors.blue,
--         }
--     },
--     line_percentage = {
--         provider = 'line_percentage',
--         left_sep = ' ',
--         hl = {
--             style = 'bold'
--         }
--     },
--     scroll_bar = {
--         provider = 'scroll_bar',
--         left_sep = ' ',
--         hl = {
--             fg = colors.blue,
--             style = 'bold'
--         }
--     },
--     -- diagnos = {
--     --     err = {
--     --         -- provider = 'diagnostic_errors',
--     --         provider = function()
--     --             return '' .. lsp_get_diag("Error")
--     --         end,
--     --         -- left_sep = ' ',
--     --         enabled = function() return lsp.diagnostics_exist('Error') end,
--     --         hl = {
--     --             fg = colors.red
--     --         }
--     --     },
--     --     warn = {
--     --         -- provider = 'diagnostic_warnings',
--     --         provider = function()
--     --             return '' ..  lsp_get_diag("Warning")
--     --         end,
--     --         -- left_sep = ' ',
--     --         enabled = function() return lsp.diagnostics_exist('Warning') end,
--     --         hl = {
--     --             fg = colors.yellow
--     --         }
--     --     },
--     --     info = {
--     --         -- provider = 'diagnostic_info',
--     --         provider = function()
--     --             return '' .. lsp_get_diag("Information")
--     --         end,
--     --         -- left_sep = ' ',
--     --         enabled = function() return lsp.diagnostics_exist('Information') end,
--     --         hl = {
--     --             fg = colors.blue
--     --         }
--     --     },
--     --     hint = {
--     --         -- provider = 'diagnostic_hints',
--     --         provider = function()
--     --             return '' .. lsp_get_diag("Hint")
--     --         end,
--     --         -- left_sep = ' ',
--     --         enabled = function() return lsp.diagnostics_exist('Hint') end,
--     --         hl = {
--     --             fg = colors.cyan
--     --         }
--     --     },
--     -- },
--     lsp = {
--         name = {
--             provider = 'lsp_client_names',
--             -- left_sep = ' ',
--             right_sep = ' ',
--             -- icon = '  ',
--             icon = '慎',
--             hl = {
--                 fg = colors.yellow
--             }
--         }
--     },
--     git = {
--         branch = {
--             provider = 'git_branch',
--             icon = ' ',
--             -- icon = ' ',
--             left_sep = ' ',
--             hl = {
--                 fg = colors.violet,
--                 style = 'bold'
--             },
--         },
--         add = {
--             provider = 'git_diff_added',
--             hl = {
--                 fg = colors.green
--             }
--         },
--         change = {
--             provider = 'git_diff_changed',
--             hl = {
--                 fg = colors.orange
--             }
--         },
--         remove = {
--             provider = 'git_diff_removed',
--             hl = {
--                 fg = colors.red
--             }
--         }
--     }
-- }
-- local components = {
--   active = {},
--   inactive = {},
-- }
--
-- table.insert(components.active, {})
-- table.insert(components.active, {})
-- table.insert(components.active, {})
-- table.insert(components.inactive, {})
-- table.insert(components.inactive, {})
-- table.insert(components.inactive, {})
--
-- table.insert(components.active[1], comps.vi_mode.left)
-- -- table.insert(components.active[1], comps.file.info)
-- table.insert(components.active[1], comps.git.branch)
-- table.insert(components.active[1], comps.git.add)
-- table.insert(components.active[1], comps.git.change)
-- table.insert(components.active[1], comps.git.remove)
-- table.insert(components.inactive[1], comps.vi_mode.left)
-- table.insert(components.inactive[1], comps.file.info)
--
-- -- table.insert(components.active[3], comps.diagnos.err)
-- -- table.insert(components.active[3], comps.diagnos.warn)
-- -- table.insert(components.active[3], comps.diagnos.hint)
-- -- table.insert(components.active[3], comps.diagnos.info)
-- table.insert(components.active[3], comps.lsp.name)
-- table.insert(components.active[3], comps.file.os)
-- table.insert(components.active[3], comps.file.position)
-- table.insert(components.active[3], comps.line_percentage)
-- table.insert(components.active[3], comps.scroll_bar)
-- table.insert(components.active[3], comps.vi_mode.right)
--
-- require'feline'.setup {
--     colors = { bg = colors.bg, fg = colors.fg },
--     components = components,
--     vi_mode_colors = vi_mode_colors,
--     force_inactive = {
--         filetypes = {
--             'packer',
--             'dashboard'
--         },
--         buftypes = {'terminal'},
--         bufnames = {}
--     }
-- }
local winbar = require("settings.winbar")
require('feline').winbar.setup({
    components = {
        active = {
            {
                {
                    provider = {
                        name = "context",
                    },
                    enabled = function()
                        -- return winbar.get_file_name
                        return winbar.config_winbar
                    end,
                },
            },
        },
    },
})

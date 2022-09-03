require 'config.telescope'
require 'config.tree-sitter'
require 'config.dap'
require 'config.notify'
require 'config.colorscheme'
require 'config.lualine'
require 'config.dashboard'

require("impatient").enable_profile()
require 'colorizer'.setup()
require("link-visitor").setup({
    silent = true,
})
require('indent_blankline').setup {
    filetype_exclude = { "dashboard", "packer", "help" },
    use_treesitter = true,
    show_current_context = true,
    show_current_context_start = true,
    show_first_indent_level = false
}

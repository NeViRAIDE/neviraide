require 'config.toggle-term'
require 'config.nvim-tree'
require 'config.colorscheme'
require 'config.telescope'
require 'config.todo-comments'
require 'config.tree-sitter'
require 'config.which_key'
require 'config.lualine'

require('nvim_comment').setup()
require('nvim-autopairs').setup {}
require('indent_blankline').setup {
    show_current_context = true,
    show_current_context_start = true,
}
require('nvim-cursorline').setup {
    cursorline = {
        enable = true,
        timeout = 1000,
        number = true,
    },
    cursorword = {
        enable = false,
    },
}
require('lsp-colors').setup {
    Error = '#db4b4b',
    Warning = '#e0af68',
    Information = '#0db9d7',
    Hint = '#10B981',
}
vim.api.nvim_exec(
    [[
    augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
]]   , false
)

require("toggleterm").setup({
    size = function(term)
        if term.direction == "horizontal" then
            return 8
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    highlights = {
        Normal = {
            guibg = "#202328",
        },
        NormalFloat = {
            guibg = "#202328",
        },
        FloatBorder = {
            guifg = "#ec5f67",
        },
    },
    direction = "horizontal",
})

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

require 'config.toggle-term.lazygit'
require 'config.toggle-term.ipython'

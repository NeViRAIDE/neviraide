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
            link = 'Normal'
        }
    },
    direction = "horizontal",
})
local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({
    cmd = "lazygit",
    count = 5,
    hidden = true,
    direction = "float",
    float_opts = {
        border = "rounded",
    },
})

function _lazygit_toggle()
    lazygit:toggle()
end

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    -- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

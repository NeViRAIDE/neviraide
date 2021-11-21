require("config.colorscheme")
require("config.telescope")
require("config.todo-comments")
require("config.tree-sitter")
require("config.nvim-tree")
require("config.indent-blankline")
require("config.saga")
require("config.which_key")

vim.g.neoformat_run_all_formatters = 1

vim.g.dashboard_preview_command = 'cat'
vim.g.dashboard_preview_pipeline = 'lolcat'
vim.g.dashboard_preview_file = "~/.config/nvim/lua/config/dash_preview"
vim.g.dashboard_preview_file_height = 17
vim.g.dashboard_preview_file_width = 90

vim.g.dashboard_default_executive = 'telescope'
-- nmap <Leader>ss :<C-u>SessionSave<CR>
-- nmap <Leader>sl :<C-u>SessionLoad<CR>

-- vim.g.dashboard_custom_shortcut = {
--  'last_session'       : 'SPC s l',
--  'find_history'       : 'SPC f h',
--  'find_file'          : 'SPC f f',
--  'new_file'           : 'SPC c n',
--  'change_colorscheme' : 'SPC t c',
--  'find_word'          : 'SPC f a',
--  'book_marks'         : 'SPC f b',
--  }
-- vim.g.dashboard_custom_shortcut_icon['last_session'] = ' '
-- vim.g.dashboard_custom_shortcut_icon['find_history'] = 'ﭯ '
-- vim.g.dashboard_custom_shortcut_icon['find_file'] = ' '
-- vim.g.dashboard_custom_shortcut_icon['new_file'] = ' '
-- vim.g.dashboard_custom_shortcut_icon['change_colorscheme'] = ' '
-- vim.g.dashboard_custom_shortcut_icon['find_word'] = ' '
-- vim.g.dashboard_custom_shortcut_icon['book_marks'] = ' '

require("lsp-colors").setup({
    Error = "#db4b4b",
    Warning = "#e0af68",
    Information = "#0db9d7",
    Hint = "#10B981"
})

require("bufferline").setup()
require("nvim-autopairs").setup{}
-- require("nvim-autopairs.completion.cmp").setup({
--     map_cr = true, --  map <CR> on insert mode
--     map_complete = true, -- it will auto insert `(` after select function or method item
--     auto_select = true -- automatically select the first item
-- })
require("nvim_comment").setup()

require("config.lualine")
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)

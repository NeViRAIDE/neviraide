local utils = require("utils")

utils.opt("o", "foldmethod", "expr")
utils.opt("o", "foldexpr", "nvim_treesitter#foldexpr()")
utils.opt("o", "foldtext", "CustomFoldText()")

vim.cmd([[
function! CustomFoldText()
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(fs)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif
    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldsize = 1 + v:foldend - v:foldstart
    let foldsizestr = " " . foldsize . " lines  "
    let expansionstring = repeat(".", w - strwidth(foldsizestr.line) + 2)
    let result = line . expansionstring . foldsizestr
    return result
endfunction
]])

require('fold-preview').setup({
    default_keybindings = false,
    border = 'rounded'
})

vim.api.nvim_exec("autocmd CursorHold * lua require'fold-preview'.show_preview()", false)

local utils = require("utils")

utils.opt("o", "foldcolumn", "auto")
utils.opt("o", "foldmethod", "expr")
utils.opt("o", "foldexpr", "nvim_treesitter#foldexpr()")
utils.opt("o", "fillchars", "fold: ,foldopen:▲,foldclose:▼")
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
    let foldsizestr = " " . foldsize . " lines  "
    let expansionstring = repeat(" ", w - strwidth(foldsizestr.line))
    let result = line . "..." . expansionstring . foldsizestr
    return result
endfunction
]])

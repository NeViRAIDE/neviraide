local utils = require("utils")
local cmd = vim.cmd

utils.opt("o", "foldmethod", "indent")
utils.opt("o", "foldcolumn", "auto")
cmd([[set fillchars=fold:\ ,foldopen:▲,foldclose:▼]])
cmd([[
    set foldexpr=GetPotionFold(v:lnum)
    set foldtext=CustomFoldText()
    function! GetPotionFold(lnum)
        if getline(a:lnum) =~? '\v^\s*$'
            return '-1'
        endif
        let this_indent = IndentLevel(a:lnum)
        let next_indent = IndentLevel(NextNonBlankLine(a:lnum))
        if next_indent == this_indent
            return this_indent
        elseif next_indent < this_indent
            return this_indent
        elseif next_indent > this_indent
            return '>' . next_indent
        endif
    endfunction
    function! IndentLevel(lnum)
        return indent(a:lnum) / &shiftwidth
    endfunction
    function! NextNonBlankLine(lnum)
        let numlines = line('$')
        let current = a:lnum + 1
        while current <= numlines
            if getline(current) =~? '\v\S'
                return current
            endif
            let current += 1
        endwhile
        return -2
    endfunction
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
    let foldsizestr = " " . foldsize . " lines ▼"
    let expansionstring = repeat(" ", w - strwidth(foldsizestr.line))
    let result = line . "..." . expansionstring . foldsizestr
    return result
    endfunction
]])

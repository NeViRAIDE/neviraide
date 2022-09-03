local autocmd = require('utils').autocmd
local add_icon = require("utils").add_icon

local folding = function()
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
    vim.opt.foldtext   = 'CustomFoldText()'
end

-- TODO: rewrite to LUA
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

autocmd("TS_FOLD_WORKAROUND", {
    'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter'
}, { callback = folding })

local ffi = require('ffi')
ffi.cdef('int curwin_col_off(void);')

function _G.fold_text()
  local text = require('settings.folding.components').content()
  local lines = require('settings.folding.components').number_of_folded_lines()
  local percent = require('settings.folding.components').percentage()

  local r = { left = { text }, right = { lines, percent } }

  local gutter_width = ffi.C.curwin_col_off()
  local visible_win_width = vim.api.nvim_win_get_width(0) - gutter_width
  local fold_text_len =
    vim.fn.strdisplaywidth(table.concat(vim.tbl_flatten(vim.tbl_values(r))))

  local expansion_str = string.rep(' ', visible_win_width - fold_text_len)

  return text .. expansion_str .. lines .. percent
end

autocmd('TS_FOLD_WORKAROUND', {
  'BufEnter',
  'BufAdd',
  'BufNew',
  'BufNewFile',
  'BufWinEnter',
}, {
  callback = function()
    vim.opt.fillchars = 'fold: '
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    vim.opt.foldtext = 'v:lua.fold_text()'
  end,
})

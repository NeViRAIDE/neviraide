return {
  'uga-rosa/ccc.nvim',
  init = function()
    require("utils").lazy_load "ccc.nvim"
  end,
  config = function()
    require('ccc').setup({
      highlighter = { auto_enable = true, excludes = { 'neo-tree' } },
    })
  end,
}

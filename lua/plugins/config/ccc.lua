return {
  'uga-rosa/ccc.nvim',
  init = function()
    require("core.utils").lazy_load "ccc.nvim"
  end,
  -- event = "VeryLazy",
  config = function()
    require('ccc').setup({
      highlighter = { auto_enable = true, excludes = { 'neo-tree' } },
    })
  end,
}

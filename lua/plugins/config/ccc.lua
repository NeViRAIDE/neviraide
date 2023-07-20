return {
  'uga-rosa/ccc.nvim',

  event = "VeryLazy",

  opts = function()
    return {
      highlighter = {
        auto_enable = true,
        excludes = { 'neo-tree' }
      },
    }
  end,
}

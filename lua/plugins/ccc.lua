return {
  'uga-rosa/ccc.nvim',
  event = { "BufReadPost", "BufNewFile" },
  opts = function()
    return {
      highlighter = {
        auto_enable = true,
        excludes = { 'neo-tree' }
      },
    }
  end,
}

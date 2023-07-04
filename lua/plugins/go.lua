return {
  "ray-x/go.nvim",
  ft = { "go", 'gomod' },
  config = function()
    require("go").setup()
  end,
  dependencies = { "ray-x/guihua.lua" },
  build = ':lua require("go.install").update_all_sync()',
}

return {
  "ray-x/go.nvim",
  init = function()
    require("utils").lazy_load "go.nvim"
  end,
  ft = { "go", 'gomod' },
  build = ':lua require("go.install").update_all_sync()',
  config = function()
    require("go").setup()
  end,
  dependencies = { "ray-x/guihua.lua" },
}

return {
  "numToStr/Comment.nvim",
  keys = {
    { "gcc", mode = "n" },
    { "gc",  mode = "v" },
    { "gbc", mode = "n" },
    { "gb",  mode = "v" },
  },
  config = function(_, opts)
    require("Comment").setup(opts)
  end,
}

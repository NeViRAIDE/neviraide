return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = function()
    local options = {
      indentLine_enabled = 1,
      filetype_exclude = {
        "help",
        "terminal",
        "lazy",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "mason",
        "nvdash",
        "nvcheatsheet",
        "noice"
      },
      buftype_exclude = { "terminal", "nofile" },
      show_trailing_blankline_indent = false,
      show_first_indent_level = false,
      show_current_context = true,
      show_current_context_start = true,
    }
    return options
  end,
  config = function(_, opts)
    require("indent_blankline").setup(opts)
  end,
}

return {
  "catppuccin/nvim",

  name = "catppuccin",

  priority = 1000,

  opts = {
    integrations = {
      cmp = true,
      gitsigns = true,
      indent_blankline = { enabled = true },
      mini = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      noice = true,
      notify = true,
      neotree = true,
      semantic_tokens = true,
      telescope = {
        enabled = true,
        style = "nvchad"
      },
      treesitter = true,
      which_key = true,
      lightspeed = true,
      ts_rainbow2 = true
    },
  },
}

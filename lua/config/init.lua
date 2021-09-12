require("config.colorscheme")
require("config.telescope")
require("config.todo-comments")
require("config.tree-sitter")
require("config.nvim-tree")
require("config.formatter")
require("config.indent-blankline")

require("lsp-colors").setup(
  {
    Error = "#db4b4b",
    Warning = "#e0af68",
    Information = "#0db9d7",
    Hint = "#10B981"
  }
)

require("bufferline").setup()
require("nvim-autopairs").setup()
require("nvim-autopairs.completion.cmp").setup(
  {
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` after select function or method item
    auto_select = true -- automatically select the first item
  }
)
require("nvim_comment").setup()

local status, lualine = pcall(require, "lualine")
if (not status) then
  return
end
lualine.setup {
  options = {
    icons_enabled = true,
    theme = "onedark",
    section_separators = {"", ""},
    component_separators = {"", ""},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch"},
    lualine_c = {"filename"},
    lualine_x = {
      {"diagnostics", sources = {"nvim_lsp"}, symbols = {error = " ", warn = " ", info = " ", hint = " "}},
      "encoding",
      "filetype"
    },
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {"fugitive", "nvim-tree"}
}
-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

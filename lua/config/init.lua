-- UI
require('config.colorscheme')
require('config.dashboard')
require('config.lualine')
require('config.notify')

-- Utils
require('config.tree-sitter')
require('config.telescope')
require('config.dap')
require('config.nvim-tree')
require('config.navic')
require('config.mason')

require('config.which_key').setup()

require('impatient').enable_profile()

require('ccc').setup({
  highlighter = {
    auto_enable = true,
  },
})

require('link-visitor').setup({
  silent = true,
})

require('indent_blankline').setup({
  filetype_exclude = { 'dashboard', 'packer', 'help' },
  use_treesitter = true,
  show_current_context = true,
  show_current_context_start = true,
  show_first_indent_level = false,
})

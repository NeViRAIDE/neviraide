-- FIX: errors in help windows (highlighter errors)
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'python', 'lua', 'html', 'css', 'markdown' },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true, additional_vim_regex_highlighting = true },
  context_commmentstring = { enable = true, enable_autocmd = false },
  rainbow = {
    enable = true,
    extended_mode = true,
  },
  autotag = { enable = true },
  tree_docs = { enable = true },
})

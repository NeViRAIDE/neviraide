local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = 'BufReadPost',
}

function M.config()
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'go', 'lua', 'markdown' },
    sync_install = false,
    auto_install = true,
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { 'BufWrite', 'CursorHold' },
    },
    highlight = { enable = true, additional_vim_regex_highlighting = true },
    context_commmentstring = { enable = true, enable_autocmd = false },
    autotag = { enable = true },
    tree_docs = { enable = true },
  })
end

return M

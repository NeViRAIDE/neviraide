return function()
  return {
    ensure_installed = { 'lua' },
    auto_install = true,
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = { enable = true },
    tree_docs = { enable = true },
    autotag = { enable = true },
    incremental_selection = { enable = true },
    textobjects = {
      enable = true,
      lsp_interop = { enable = true },
      move = { enable = true, set_jumps = true },
      select = { enable = true },
      swap = { enable = true },
    },
  }
end

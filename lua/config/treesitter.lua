return {
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  context_commentstring = { enable = true },
  indent = { enable = true },
  rainbow = {
    enable = true,
    disable = { 'jsx', 'cpp' },
    query = 'rainbow-parens',
  },
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

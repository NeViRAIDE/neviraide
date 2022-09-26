require('neogen').setup({
  enable = true,
  snippet_engine = 'luasnip',
  languages = {
    python = {
      template = {
        annotation_convention = 'google_docstrings',
        -- annotation_convention = 'numpydoc',
      },
    },
  },
})

require('neogen').setup({
    enable = true,
    snippet_engine = "luasnip",
    languages = {
        python = {
            template = {
                annotation_convention = "numpydoc"
            }
        },
    }
})

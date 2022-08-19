local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier.with({
            disabled_filetypes = { 'vue' },
            extra_filetypes = { 'htmldjango' }
        }),
        null_ls.builtins.formatting.black.with({
            extra_args = { "-l 79" },
        }),
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.djlint,
        null_ls.builtins.completion.tags,
    },
})

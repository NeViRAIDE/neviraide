require 'lspconfig'.cssls.setup {
    on_attach = require("lsp.on_attach").build(),
    capabilities = require("lsp.capabilities").build(),
    single_file_support = true,
    filetypes = { "css", "scss", "less" },
    settings = {
        css = {
            validate = true
        },
        less = {
            validate = true
        },
        scss = {
            validate = true
        }
    }
}

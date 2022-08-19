require 'lspconfig'.html.setup {
    on_attach = require("lsp.on_attach").build(),
    capabilities = require("lsp.capabilities").build(),
    filetypes = {
        "html", "htmldjango"
    },
    single_file_support = true,
    init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true
        },
        provideFormatter = false
    }
}

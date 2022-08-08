vim.diagnostic.config({
    severity_sort = true,
    update_in_insert = false,
    float = {
        source = "if_many",
        border = "rounded",
        header = { "   Diagnostics: ", "diagnostic" },
        focusable = false,
        focus = false,
    },
})

require "lsp.servers.lua"
require "lsp.servers.pyright"
require "lsp.servers.emmet"

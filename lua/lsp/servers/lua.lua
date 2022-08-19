require("lspconfig").sumneko_lua.setup {
    on_attach = require "lsp.on_attach".build(),
    capabilities = require("lsp.capabilities").build(),
    flags = { debounce_text_changes = 150 },
    single_file_support = true,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ";")
            },
            diagnostics = { globals = { "vim" } },
            telemetry = {
                enable = false,
            },
        },
    }
}

require("lspconfig").sumneko_lua.setup {
    on_attach = require("lsp.on_attach").build(),
    flags = { debounce_text_changes = 150 },
    single_file_support = true,
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
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

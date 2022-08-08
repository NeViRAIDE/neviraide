local lspconfig = require "lspconfig"
lspconfig.pyright.setup {
    root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname)
    end;
    single_file_support = true,
    on_attach = require("lsp.on_attach").build(),
    flags = { debounce_text_changes = 150 },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    }
}

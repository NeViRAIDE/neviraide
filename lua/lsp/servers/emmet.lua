require("lspconfig").emmet_ls.setup({
    on_attach = require "lsp.on_attach".build(),
    flags = { debounce_text_changes = 150 },
    filetypes = { 'htmldjango', 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
})

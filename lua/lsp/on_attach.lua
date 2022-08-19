local M = {}

local border = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}
local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}
local signature_config = {
    bind = true,
    hint_enable = false,
    handler_opts = {
        border = "rounded"
    },
    floating_window = true,
    floating_window_above_cur_line = true,
    cursorhold_update = true
}

M.build = function()
    return function(client, bufnr)
        require 'lsp_signature'.on_attach(signature_config, bufnr)
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = false
        })
        for _, sign in ipairs(signs) do
            vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
        end
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = border,
            focusable = true,
        })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = border,
            focusable = true,
        })
        if client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_exec(
                [[
                hi LspReferenceRead  gui=bold guibg=#41495A
                hi LspReferenceText  gui=bold guibg=#41495A
                hi LspReferenceWrite gui=bold guibg=#41495A
                augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                augroup END
            ]]   ,
                false
            )
        end
    end
end

return M

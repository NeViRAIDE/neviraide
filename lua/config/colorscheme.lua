local onedark = require("onedark")
onedark.setup({
    highlights = {
        TSException = { fg = "#c678dd", fmt = "italic" },
        TSKeywordFunction = { fg = "#c678dd", fmt = "italic,bold" },
        TSInclude = { fg = "#c678dd", fmt = "italic,bold" },
        CursorLineNr = { fmt = "bold" },
        NormalFloat = { bg = "none" },
        FloatBorder = { fg = "Gray", bg = "none" },
        Diagnostic = { fg = "DarkYellow", fmt = "italic,bold" },
        -- Folded = { fg = "#59ff23", bg = "none" },
        Folded = { fg = "#6621ef", bg = "none" },
        TSComment = { fmt = "none" },
        Comment = { fmt = "none" },
        StatusLine = { bg = "none" },
        LspSignatureActiveParameter = { fg = "LightGreen", fmt = "bold" },
    },
    diagnostics = {
        background = false,
    },
    code_style = {
        strings = "italic",
        keywords = "italic,bold",
    },
})
onedark.load()

require("todo-comments").setup({
    signs = true,
    sign_priority = 8,
    keywords = {
        FIX = { icon = " ", color = "#db4b4b" },
        TODO = { icon = " ", color = "#0db9d7" },
        HACK = { icon = " ", color = "#FBBF24" },
        WARN = { icon = " ", color = "#e0af68" },
        PERF = { icon = " ", color = "#c678dd" },
        NOTE = { icon = " ", color = "#10B981" },
    },
    merge_keywords = true,
    highlight = {
        before = "",
        keyword = "wide",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]],
        comments_only = true,
        max_line_len = 400,
    },
    search = {
        command = "rg",
        args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
        },
        pattern = [[\b(KEYWORDS):]],
    },
})

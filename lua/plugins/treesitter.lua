return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = '*',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    opts = {
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      context_commentstring = { enable = true },
      indent = { enable = true },
      rainbow = {
        enable = true,
        disable = { 'jsx', 'cpp' },
        query = 'rainbow-parens',
      },
      tree_docs = { enable = true },
      autotag = { enable = true },
      incremental_selection = { enable = true },
      textobjects = {
        enable = true,
        lsp_interop = { enable = true },
        move = { enable = true, set_jumps = true },
        select = { enable = true },
        swap = { enable = true },
      },
    },
    config = function(_, opts) require('nvim-treesitter.configs').setup(opts) end,
    dependencies = {
      'HiPhish/nvim-ts-rainbow2',
      'windwp/nvim-ts-autotag',
      -- {
      --   'nvim-treesitter/nvim-treesitter-context',
      --   config = function()
      --     local ts_context = require('treesitter-context')
      --     ts_context.setup({
      --       enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      --       max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
      --       min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      --       line_numbers = true,
      --       multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
      --       trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      --       mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
      --       -- Separator between context and content. Should be a single character string, like '-'.
      --       -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      --       separator = nil,
      --       zindex = 20, -- The Z-index of the context window
      --     })
      --   end,
      -- },
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  },
}

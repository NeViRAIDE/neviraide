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
    config = function(_, opts)
      dofile(vim.g.neviraide_themes_cache .. 'syntax')
      require('nvim-treesitter.configs').setup(opts)
    end,
    dependencies = {
      'HiPhish/nvim-ts-rainbow2',
      'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  },
}

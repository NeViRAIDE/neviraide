return {
  {
    'mrcjkb/rustaceanvim',
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = {
        inlay_hints = {
          highlight = 'NonText',
        },
        tools = {
          hover_actions = { replace_builtin_hover = false },
          reload_workspace_from_cargo_toml = true,
        },
        server = {
          capabilities = require('neviraide.lsp.servers.rs').capabilities,
          settings = require('neviraide.lsp.servers.rs').settings,
          -- init_options = {
          --   userLanguages = {
          --     rust = 'html',
          --   },
          -- },
        },
      }
    end,
  },

  {
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local null_ls = require('null-ls')
      require('crates').setup({
        popup = {
          border = vim.g.b,
        },
        null_ls = {
          enabled = true,
          name = 'crates.nvim',
        },
        src = {
          cmp = {
            enabled = true,
          },
        },
      })
    end,
  },
}

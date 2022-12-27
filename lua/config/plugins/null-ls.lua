local M = {
  'jose-elias-alvarez/null-ls.nvim',
  event = 'BufReadPre',
  dependencies = { 'nvim-lua/plenary.nvim' },
}

function M.config()
  local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
  if not null_ls_status_ok then return end

  local formatting = null_ls.builtins.formatting
  local hover = null_ls.builtins.hover
  local code_action = null_ls.builtins.code_actions

  null_ls.setup({
    sources = {
      code_action.gitsigns,
      hover.dictionary,
      formatting.stylua.with({
        extra_args = {
          '--quote-style',
          'AutoPreferSingle',
          '--indent-type',
          'Spaces',
          '--indent-width',
          '2',
          '--column-width',
          '80',
          '--collapse-simple-statement',
          'Always',
        },
      }),
    },
  })
end

return M

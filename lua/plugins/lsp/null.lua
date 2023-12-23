return function()
  local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
  if not null_ls_status_ok then return end

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local hover = null_ls.builtins.hover
  local code_action = null_ls.builtins.code_actions

  return {
    root_dir = require('null-ls.utils').root_pattern(
      '.null-ls-root',
      '.neoconf.json',
      'Makefile',
      '.git'
    ),
    null_ls.setup({
      sources = {
        code_action.gitsigns,

        hover.dictionary,

        formatting.golines,
        diagnostics.revive,

        diagnostics.fish,
        formatting.fish_indent,

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
        formatting.shfmt,
        formatting.prettier.with({
          extra_args = {
            '--jsx-single-quote',
            '--vue-indent-script-and-style',
            '--no-semi',
            '--single-quote',
            '--single-attribute-per-line',
            '--trailing-comma',
            'none',
          },
        }),
      },
    }),
  }
end

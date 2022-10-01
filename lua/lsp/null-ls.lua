local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then return end

local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover
local code_action = null_ls.builtins.code_actions

null_ls.setup({
  sources = {
    code_action.gitsigns,
    hover.dictionary,
    formatting.djlint.with({
      timeout = 10000,
      extra_args = {
        '--indent',
        '2',
      },
    }),
    formatting.prettier.with({
      disabled_filetypes = { 'markdown', 'json' },
      -- disabled_filetypes = { 'vue' },
      -- extra_filetypes = { 'htmldjango' },
      extra_args = {
        '--single-quote',
        '--no-semi',
        '--vue-indent-script-and-style',
      },
    }),
    formatting.black.with({ extra_args = { '-l 79' } }),
    formatting.isort,
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

local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then return end

local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover

null_ls.setup({
  sources = {
    hover.dictionary,
    formatting.prettier.with({
      -- disabled_filetypes = { 'vue' },
      extra_filetypes = { 'htmldjango' },
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
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_buf_create_user_command(
        bufnr,
        'LspFormatting',
        function() vim.lsp.buf.format() end,
        {}
      )
    end
  end,
})

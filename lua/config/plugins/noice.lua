local M = {
  'folke/noice.nvim',
  dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
  event = 'VeryLazy',
}

function M.config()
  require('noice').setup({
    cmdline = {
      format = {
        filter = { icon = icon('terminal') },
        search_down = {
          icon = icon('search') .. icon('chevron-down'),
        },
        search_up = {
          icon = icon('search') .. icon('chevron-up'),
        },
        lua = { icon = icon('lua') },
        help = { icon = icon('question') },
      },
    },
    lsp = {
      signature = {
        enabled = true,
        auto_open = {
          enabled = false,
          trigger = false,
          luasnip = false,
        },
      },
      message = { enabled = true },
      hover = { enabled = true },
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
  })

  vim.keymap.set('n', '<c-j>', function()
    if not require('noice.lsp').scroll(4) then return ':wincmd j<cr>' end
  end, { silent = true, expr = true })

  vim.keymap.set('n', '<c-k>', function()
    if not require('noice.lsp').scroll(-4) then return ':wincmd k<cr>' end
  end, { silent = true, expr = true })

  vim.keymap.set(
    'c',
    '<S-Enter>',
    function() require('noice').redirect(vim.fn.getcmdline()) end,
    { desc = 'Redirect Cmdline' }
  )

  require('settings.override_vim_ui')

  require('utils.startup')
end

return M

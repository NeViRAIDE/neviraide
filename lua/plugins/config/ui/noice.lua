return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      signature = {
        auto_open = {
          enabled = false,
          trigger = false,
          luasnip = false,
        },
      },
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
    },
    routes = {
      {
        view = 'split',
        filter = { min_width = 500 },
      },
    },
    views = {
      split = {
        enter = true
      }
    },

    vim.keymap.set({ 'n', 'i', 's' }, '<c-j>', function()
      if not require('noice.lsp').scroll(4) then return ':wincmd j<cr>' end
    end, { silent = true, expr = true }),

    vim.keymap.set({ 'n', 'i', 's' }, '<c-k>', function()
      if not require('noice.lsp').scroll(-4) then return ':wincmd k<cr>' end
    end, { silent = true, expr = true }),

    -- execute cmdmode command and stay cmdline open
    vim.keymap.set(
      'c',
      '<S-Enter>',
      function() require('noice').redirect(vim.fn.getcmdline()) end,
      { desc = 'Redirect Cmdline' }
    )
  },
}
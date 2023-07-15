return {
  "folke/which-key.nvim",
  keys = { "<leader>", '"', "'", "`", "<c-n>", "v" },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    require('which-key').setup(
      {
        plugins = {
          spelling = { enabled = true },
        },
        key_labels = {
          ['<space>'] = 'Space',
          ['<cr>'] = 'Enter',
          ['<CR>'] = 'Enter',
          ['<tab>'] = 'TAB',
          ['<c-w>'] = 'Ctrl + w',
          ['<C-S>'] = 'Ctrl + s',
          ['<C-L>'] = 'Ctrl + l',
          ['<C-Bslash>'] = 'Ctrl + \\',
          ['<C-P>'] = 'Ctrl + p',
          ['<C-H>'] = 'Ctrl + h',
          ['<C-l>'] = 'Ctrl + l',
        },
        popup_mappings = { scroll_down = '<c-j>', scroll_up = '<c-k>' },
        layout = {
          height = { min = 5, max = 30 },
          width = { min = 20, max = 90 },
          spacing = 14,
          align = 'center',
        },
        hidden = {
          '<Plug>',
          'require',
          'execute v:count .',
          '<silent>',
          ':',
          '<Cmd>',
          '<CR>',
          'call',
          'lua',
          '^:',
          '^ ',
          '("nvim-treesitter.textsubjects")',
        },
      })
    require('core.mappings').setup()
  end
}

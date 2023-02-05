local M = {
  'folke/which-key.nvim',
  opt = true,
  keys = '<leader>',
}

function M.config()
  vim.o.timeout = true
  vim.o.timeoutlen = 300

  require('which-key').setup({
    plugins = {
      spelling = { enabled = true },
    },
    icons = {
      breadcrumb = icon('chevron-right', '', '>>'),
      separator = icon('arrow-right', '→', '->'),
      group = icon('plus', '', '+'),
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
    window = {
      border = 'rounded',
      position = 'bottom',
      margin = { 1, 1, 1, 1 },
      padding = { 1, 1, 1, 1 },
      winblend = 10,
    },
    layout = {
      height = { min = 5, max = 30 },
      width = { min = 20, max = 70 },
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

  require('config.plugins.which-key.keybindings.main').setup()
end

return M

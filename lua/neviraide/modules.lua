return {
  {
    'NeViRAIDE/neviraide-ui',
    dev = true,
    event = 'VeryLazy',
    opts = {
      kitty = {
        enable = true,
      },
      ui = {
        -- hyde = vim.g.hyde,
        notify = vim.g.notif,
      },
    },
  },
  {
    'NeViRAIDE/chameleon.nvim',
    dependencies = { { 'NeViRAIDE/stigmata.nvim', dev = true } },
    event = 'VeryLazy',
    dev = true,
    opts = { hyde = vim.g.hyde },
  },
  {
    'NeViRAIDE/whisper.nvim',
    event = 'VeryLazy',
    dev = true,
  },
  {
    'NeViRAIDE/harbinger.nvim',
    event = 'UIEnter',
    dev = true,
  },
  {
    'NeViRAIDE/neviline.nvim',
    event = 'UIEnter',
    dev = true,
  },
  {
    'NeViRAIDE/nevitabs.nvim',
    event = { 'TabNew', 'TabClosed', 'BufRead' },
    dev = true,
  },
  {
    'NeViRAIDE/diagnoz.nvim',
    event = 'LspAttach',
    dev = true,
    config = true,
  },
  {
    'NeViRAIDE/nekifoch.nvim',
    dev = true,
    event = { 'BufReadPost', 'BufNewFile' },
    keys = { '<leader>sf', 'Nekifoch' },
    opts = {
      which_key = {
        enable = true,
      },
      borders = vim.g.b,
    },
  },
}

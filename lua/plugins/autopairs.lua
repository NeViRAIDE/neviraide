return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {
    fast_wrap = {},
    disable_filetype = { 'TelescopePrompt', 'vim' },
  },
  config = function(_, opts) require('nvim-autopairs').setup(opts) end,
}

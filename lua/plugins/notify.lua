return {
  'rcarriga/nvim-notify',
  event = 'VeryLazy',
  config = function() vim.notify = require('notify') end,
}

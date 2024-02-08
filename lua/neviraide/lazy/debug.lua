return {
  {
    'mfussenegger/nvim-dap',
    event = 'BufReadPre',
    dependencies = {
      { 'theHamsta/nvim-dap-virtual-text', config = true },
      { 'rcarriga/nvim-dap-ui', config = true },
      { 'leoluz/nvim-dap-go', config = true },
    },
    config = require('plugins.dap.config'),
  },
}

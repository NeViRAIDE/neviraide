return {
  {
    'mfussenegger/nvim-dap',
    event = 'BufReadPre',
    dependencies = {
      { 'theHamsta/nvim-dap-virtual-text', config = true },
      { 'rcarriga/nvim-dap-ui', config = true },
      { 'leoluz/nvim-dap-go', config = true },
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end

      vim.fn.sign_define(
        'DapBreakpoint',
        { text = '🛑', texthl = '', linehl = '', numhl = '' }
      )
      vim.fn.sign_define(
        'DapBreakpointCondition',
        { text = '🔵', texthl = '', linehl = '', numhl = '' }
      )
      vim.fn.sign_define(
        'DapLogPoint',
        { text = '🟢', texthl = '', linehl = '', numhl = '' }
      )
      vim.fn.sign_define(
        'DapStopped',
        { text = '⏩', texthl = '', linehl = '', numhl = '' }
      )
    end,
  },

  {
    'ggandor/lightspeed.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
  },

  {
    'xiyaowong/transparent.nvim',
    cmd = {
      'TransparentEnable',
      'TransparentDisable',
      'TransparentToggle',
    },
    config = function()
      vim.api.nvim_set_hl(
        0,
        'NotifyBackground',
        vim.api.nvim_get_hl(0, { name = 'Normal' })
      )
      require('transparent').setup({
        extra_groups = {
          'FloatBorder',
          'NeoTreeNormal',
          'NeoTreeNormalNC',
          'NeoTreeEndOfBuffer',
          'NeoTreeStatusLine',
        },
      })
    end,
  },

  {
    'uga-rosa/ccc.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = function()
      return {
        highlighter = {
          auto_enable = true,
          excludes = { 'neo-tree' },
        },
      }
    end,
  },

  {
    'numToStr/Comment.nvim',
    keys = {
      { 'gcc', mode = 'n' },
      { 'gc', mode = 'v' },
      { 'gbc', mode = 'n' },
      { 'gb', mode = 'v' },
    },
    config = function(_, opts) require('Comment').setup(opts) end,
  },
}

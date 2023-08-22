local markdown_preview = {
  'iamcco/markdown-preview.nvim',
  build = 'cd app && ./install.sh',
  ft = { 'markdown' },
  config = function() vim.g.mkdp_filetypes = { 'markdown' } end,
}

local transparent = {
  'xiyaowong/transparent.nvim',
  version = '*',
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
}

local colorpicker = {
  'uga-rosa/ccc.nvim',
  version = '*',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = function()
    return {
      highlighter = {
        auto_enable = true,
        excludes = { 'neo-tree' },
      },
    }
  end,
}

local comment = {
  'numToStr/Comment.nvim',
  version = '*',
  keys = {
    { 'gcc', mode = 'n' },
    { 'gc', mode = 'v' },
    { 'gbc', mode = 'n' },
    { 'gb', mode = 'v' },
  },
  config = function(_, opts) require('Comment').setup(opts) end,
}

local debug = {
  'mfussenegger/nvim-dap',
  version = '*',
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
    dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

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
}

local motion = {
  'ggandor/lightspeed.nvim',
  version = '*',
  event = { 'BufReadPost', 'BufNewFile' },
}

return {
  debug,
  motion,
  transparent,
  colorpicker,
  comment,
  markdown_preview,
}

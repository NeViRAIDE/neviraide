local markdown_preview = {
  'iamcco/markdown-preview.nvim',
  build = 'cd app && ./install.sh',
  ft = { 'markdown' },
  config = function() vim.g.mkdp_filetypes = { 'markdown' } end,
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
    { 'gcc', mode = 'n', desc = 'Comment toggle current line' },
    { 'gc', mode = { 'n', 'o' }, desc = 'Comment toggle linewise' },
    { 'gc', mode = 'x', desc = 'Comment toggle linewise (visual)' },
    { 'gbc', mode = 'n', desc = 'Comment toggle current block' },
    { 'gb', mode = { 'n', 'o' }, desc = 'Comment toggle blockwise' },
    { 'gb', mode = 'x', desc = 'Comment toggle blockwise (visual)' },
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
    dofile(vim.g.neviraide_themes_cache .. 'dap')
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
  {
    'NvChad/nvterm',
    opts = {
      terminals = {
        type_opts = {
          float = {
            border = require('neviraide.utils').border(),
          },
          horizontal = { location = 'rightbelow', split_ratio = 0.3 },
          vertical = { location = 'rightbelow', split_ratio = 0.5 },
        },
      },
    },
    config = function(_, opts)
      require('neviraide-ui.themes.term')
      require('nvterm').setup(opts)
    end,
  },
  debug,
  motion,
  colorpicker,
  comment,
  markdown_preview,
}

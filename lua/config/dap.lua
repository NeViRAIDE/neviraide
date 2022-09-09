local dap = require('dap')
local dapui = require('dapui')
local dappy = require('dap-python')

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

dappy.setup('~/.virtualenvs/debugpy/bin/python')
require('nvim-dap-virtual-text').setup({
  enabled = true,
  enabled_commands = false,
  highlight_changed_variables = true,
  highlight_new_as_changed = true,
  show_stop_reason = true,
  commented = false, -- prefix virtual text with comment string
  only_first_definition = true,
  all_references = false,
  -- experimental features:
  virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
  all_frames = true,
  virt_lines = false,
  virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
  -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
})
-- require('dap-python').test_runner = 'pytest'

dapui.setup({
  icons = { expanded = '▾', collapsed = '▸' },
  mappings = {
    expand = { '<CR>', '<2-LeftMouse>' },
    open = 'o',
    remove = 'd',
    edit = 'e',
    repl = 'r',
    toggle = 't',
  },
  expand_lines = vim.fn.has('nvim-0.7'),
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = 'scopes', size = 0.20 },
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40, -- 40 columns
      position = 'left',
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 0.25, -- 25% of total lines
      position = 'bottom',
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = 'rounded', -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { 'q', '<Esc>' },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  },
})

dap.listeners.after.event_initialized['dapui_config'] =
  function() dapui.open() end
dap.listeners.before.event_terminated['dapui_config'] =
  function() dapui.close() end
dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

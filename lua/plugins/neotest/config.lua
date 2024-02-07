return function()
  -- get neotest namespace (api call creates or returns namespace)
  local neotest_ns = vim.api.nvim_create_namespace('neotest')
  vim.diagnostic.config({
    virtual_text = {
      format = function(diagnostic)
        local message = diagnostic.message
          :gsub('\n', ' ')
          :gsub('\t', ' ')
          :gsub('%s+', ' ')
          :gsub('^%s+', '')
        return message
      end,
    },
  }, neotest_ns)

  require('neotest').setup({
    adapters = {
      require('rustaceanvim.neotest'),
      require('neotest-go')({
        status = {
          enabled = true,
          signs = true,
          virtual_text = true,
        },
        running = {
          concurrent = true,
        },
        output = {
          enabled = true,
          open_on_run = 'short',
        },
        icons = {
          child_indent = '│',
          child_prefix = '├',
          collapsed = '─',
          expanded = '╮',
          failed = '',
          final_child_indent = ' ',
          final_child_prefix = '╰',
          non_collapsible = '─',
          passed = '',
          running = '',
          running_animated = { '/', '|', '\\', '-', '/', '|', '\\', '-' },
          skipped = '',
          unknown = '',
          watching = '',
        },
        floating = {
          border = 'rounded',
          max_height = 0.6,
          max_width = 0.6,
          options = {},
        },
        experimental = {
          test_table = true,
        },
        args = { '-v', '-count=1', '-timeout=60s' },
      }),
    },
  })
end

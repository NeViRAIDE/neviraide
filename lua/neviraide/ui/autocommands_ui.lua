---@diagnostic disable: need-check-nil

local api = vim.api
local autocmd = require('neviraide.ui.neviraide.utils').autocmd

autocmd('NEVIRAIDE_dashresized', 'VimResized', {
  callback = function()
    if vim.bo.filetype == 'neviraideDashboard' then
      vim.opt_local.modifiable = true
      api.nvim_buf_set_lines(0, 0, -1, false, { '' })
      require('neviraide.ui.neviraide-ui.dashboard').open()
    end
  end,
})

autocmd('NEVIRAIDE_lspprog', 'User', {
  pattern = 'LspProgressUpdate',
  callback = function() vim.cmd('redrawstatus') end,
})

-- FIX: set darder bg for help
autocmd('NeviraideHelpDarkerBG', 'FileType', {
  pattern = 'help',
  callback = function()
    local current_win = vim.api.nvim_get_current_win()
    vim.api.nvim_set_option_value(
      'winhighlight',
      'Normal:NeviraideHelpDarkerBG',
      { win = current_win }
    )
  end,
})

autocmd('NeviraideResetCursorLinehl', 'FileType', {
  pattern = '*',
  callback = function()
    vim.api.nvim_set_option_value(
      'winhighlight',
      'CursorLine:CursorLine',
      { win = vim.api.nvim_get_current_win() }
    )
  end,
})
autocmd('NeviraideDashActiveButton', 'FileType', {
  pattern = 'neviraideDashboard',
  callback = function()
    vim.api.nvim_set_option_value(
      'winhighlight',
      'CursorLine:DashboardCursorLine',
      { win = vim.api.nvim_get_current_win() }
    )
  end,
})

-- FIX: not change bg when out from darker window (help) - change to buf from win
autocmd('NeviraideTerminalDarkerBG', 'TermOpen', {
  pattern = '*',
  callback = function()
    local current_win = vim.api.nvim_get_current_win()
    vim.api.nvim_set_option_value(
      'winbar',
      '%#NeviraideTerminalWinbar#',
      { win = current_win }
    )
    vim.api.nvim_set_option_value(
      'winhighlight',
      'Normal:NeviraideTerminalDarkerBG',
      { win = current_win }
    )
  end,
})

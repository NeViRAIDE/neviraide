return function()
  dofile(vim.g.ntc .. 'notify')

  vim.notify = function(msg, log_level, opts)
    if
      string.match(
        msg,
        'method textDocument/documentColor is not supported by any of the servers registered for the current buffer'
      )
    then
    -- Do nothing to suppress the warning
    else
      -- Call the original vim.notify function for other messages
      vim.notify(msg, log_level, opts)
    end
  end

  -- TODO: customize
  return {
    minimum_width = 10,
    max_height = function() return math.floor(vim.o.lines * 0.75) end,
    max_width = function() return math.floor(vim.o.columns * 0.75) end,
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 100, border = vim.g.b })
    end,
    icons = {
      DEBUG = '',
      ERROR = '',
      INFO = '',
      TRACE = '✎',
      WARN = '',
    },
  }
end

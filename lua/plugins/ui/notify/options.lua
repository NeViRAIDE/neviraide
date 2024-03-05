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

  return {
    minimum_width = 10,
    -- TODO: customize
  }
end

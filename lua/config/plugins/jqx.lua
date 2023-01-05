local M = {
  'gennaro-tedesco/nvim-jqx',
  event = 'BufReadPre',
  ft = { 'json', 'yaml', 'yml' },
}

function M.config()
  require('nvim-jqx.config').use_quickfix = false
  require('nvim-jqx.config').close_window_key = 'q'
  require('nvim-jqx.config').query_key = 'Q'
  vim.g.mkdp_filetypes = { 'json', 'yaml', 'yml' }
  autocmd('NEVIRAIDE_JQX', 'FileType', {
    pattern = { 'json', 'yaml', 'yml' },
    desc = 'Add markdown features',
    callback = function() require('config.which-key').attach_jqx(0) end,
  })
end

return M

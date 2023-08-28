local M = {}

M.init = function()
  -- load gitsigns only when a git file is opened
  vim.api.nvim_create_autocmd({ 'BufRead' }, {
    group = vim.api.nvim_create_augroup('GitSignsLazyLoad', { clear = true }),
    callback = function()
      vim.fn.system(
        'git -C ' .. '"' .. vim.fn.expand('%:p:h') .. '"' .. ' rev-parse'
      )
      if vim.v.shell_error == 0 then
        vim.api.nvim_del_augroup_by_name('GitSignsLazyLoad')
        vim.schedule(
          function() require('lazy').load({ plugins = { 'gitsigns.nvim' } }) end
        )
      end
    end,
  })
end

-- FIX: border for blame
M.opts = function()
  dofile(vim.g.neviraide_themes_cache .. 'git')
  return {
    signs = {
      add = { text = '│' },
      change = { text = '│' },
      delete = { text = '󰍵' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '│' },
    },
  }
end

return M

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

M.opts = function()
  dofile(vim.g.neviraide_themes_cache .. 'git')

  return {
    signcolumn = NEVIRAIDE().gitsigns_signs,
    signs = {
      add = { text = '│' },
      change = { text = '│' },
      delete = { text = '󰍵' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '│' },
    },
    preview_config = { border = vim.g.borders },
    current_line_blame = NEVIRAIDE().gitsigns_current_line_blame,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  }
end

return M

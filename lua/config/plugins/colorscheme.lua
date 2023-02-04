local M = {
  'briones-gabriel/darcula-solid.nvim',
  dependencies = 'rktjmp/lush.nvim',
  lazy = false,
}

function M.config()
  if vim.api.nvim_exec('echo $TERM', '') == 'linux' then
    -- TODO: make or find good (or better than "blue") colorscheme for non gui using
    vim.cmd('colorscheme blue')
  else
    vim.cmd('colorscheme darcula-solid')
  end
end

return M

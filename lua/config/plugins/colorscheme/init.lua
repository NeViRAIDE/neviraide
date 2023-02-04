local M = {
  'briones-gabriel/darcula-solid.nvim',
  dependencies = 'rktjmp/lush.nvim',
  lazy = false,
}
function M.config()
  if
    vim.api.nvim_exec('echo $TERM', '') == 'linux'
    or vim.api.nvim_exec('echo $TERM', '') == 'screen'
  then
    require('config.plugins.colorscheme.server')
  else
    require('config.plugins.colorscheme.darcula_solid')
  end
end

return M

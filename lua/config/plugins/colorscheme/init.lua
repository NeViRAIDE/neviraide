local M = {
  'briones-gabriel/darcula-solid.nvim',
  dependencies = 'rktjmp/lush.nvim',
  lazy = false,
}
function M.config()
  if term == 'linux' or term == 'screen' then
    require('config.plugins.colorscheme.server')
  else
    require('config.plugins.colorscheme.darcula_solid')
  end
end

return M

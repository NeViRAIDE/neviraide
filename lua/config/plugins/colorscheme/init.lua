-- TODO: dynamicly change colorscheme
-- local M = {
--   'briones-gabriel/darcula-solid.nvim',
--   dependencies = 'rktjmp/lush.nvim',
--   lazy = false,
-- }

local M = {
  'olimorris/onedarkpro.nvim',
  lazy = false,
  -- priority = 1000, -- Ensure it loads first
  -- config = function() require('onedarkpro').setup() end,
  config = true,
}

function M.config()
  -- if term == 'linux' or term == 'screen' then
  --   require('config.plugins.colorscheme.server')
  -- else
  --   require('config.plugins.colorscheme.darcula_solid')
  -- end
  vim.cmd('colorscheme onedark')
end

return M

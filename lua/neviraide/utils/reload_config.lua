local M = {}

M.reload_transparency = function()
  require('plenary.reload').reload_module('NEVIRAIDE')

  vim.g.transparency = NEVIRAIDE().transparency

  vim.cmd('Lazy reload nvim-web-devicons')
  require('plenary.reload').reload_module('config.telescope')
  vim.cmd('Lazy reload telescope.nvim')
  require('plenary.reload').reload_module('config.whichkey')
  vim.cmd('Lazy reload which-key.nvim')

  vim.notify('Transparency reloaded...', 2, { title = 'Reload' })
end

M.reload_borders = function()
  require('plenary.reload').reload_module('NEVIRAIDE')

  vim.g.borders = NEVIRAIDE().border

  require('plenary.reload').reload_module('config.telescope')
  vim.cmd('Lazy reload telescope.nvim')
  require('plenary.reload').reload_module('config.whichkey')
  vim.cmd('Lazy reload which-key.nvim')
  require('plenary.reload').reload_module('config.lsp.mason')
  vim.cmd('Lazy reload mason.nvim')
  require('plenary.reload').reload_module('neviraide.lsp.options')
  vim.cmd('Lazy reload gitsigns.nvim')

  vim.notify('Borders reloaded...', 2, { title = 'Reload' })
end

M.reload_icons = function()
  require('plenary.reload').reload_module('NEVIRAIDE')

  local config = NEVIRAIDE()

  vim.g.nonicons = config.nonicons

  vim.cmd('Lazy reload nvim-web-devicons')
  require('plenary.reload').reload_module('config.telescope')
  vim.cmd('Lazy reload telescope.nvim')
  require('plenary.reload').reload_module('config.whichkey')
  vim.cmd('Lazy reload which-key.nvim')
  require('plenary.reload').reload_module('config.lsp.mason')
  vim.cmd('Lazy reload mason.nvim')
  require('plenary.reload').reload_module('neviraide.lsp.options')

  -- statusline
  require('plenary.reload').reload_module('neviraide-ui.statusline')
  vim.opt.statusline = "%!v:lua.require('neviraide-ui.statusline').run()"

  -- tabufline
  require('plenary.reload').reload_module('neviraide-ui.buftabline.modules')
  vim.opt.tabline = "%!v:lua.require('neviraide-ui.buftabline.modules')()"

  vim.notify('Config reloaded...', 2, { title = 'Reload' })
end

M.reload_config = function()
  require('plenary.reload').reload_module('NEVIRAIDE')

  local config = NEVIRAIDE()

  vim.g.neviraide_theme = config.theme
  vim.g.transparency = config.transparency
  vim.g.blend = config.blend
  vim.g.borders = config.border
  vim.g.nonicons = config.nonicons

  vim.o.cursorline = config.cursor_line
  vim.o.pumblend = config.blend
  vim.o.cursorcolumn = config.cursor_column
  vim.o.number = config.numbers_enabled
  vim.o.relativenumber = config.relative_numbers
  vim.o.shiftwidth = config.indents
  vim.o.tabstop = config.indents
  vim.o.softtabstop = config.indents

  vim.cmd('Lazy reload nvim-web-devicons')
  require('plenary.reload').reload_module('config.telescope')
  vim.cmd('Lazy reload telescope.nvim')
  require('plenary.reload').reload_module('config.whichkey')
  vim.cmd('Lazy reload which-key.nvim')
  require('plenary.reload').reload_module('config.lsp.mason')
  vim.cmd('Lazy reload mason.nvim')
  require('plenary.reload').reload_module('neviraide.lsp.options')
  vim.cmd('Lazy reload gitsigns.nvim')
  -- statusline
  require('plenary.reload').reload_module('neviraide-ui.statusline')
  vim.opt.statusline = "%!v:lua.require('neviraide-ui.statusline').run()"
  -- tabufline
  require('plenary.reload').reload_module('neviraide-ui.buftabline.modules')
  vim.opt.tabline = "%!v:lua.require('neviraide-ui.buftabline.modules')()"

  vim.notify('Config reloaded...', 2, { title = 'Reload' })
end

return M

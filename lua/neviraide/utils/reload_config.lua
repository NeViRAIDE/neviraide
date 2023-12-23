local M = {}

local function refresh_highlights()
  require('neviraide-ui.themes').load_all_highlights()
end

---Reload module with plenary
---@param module string|table
local function reload_plenary(module)
  if type(module) == 'table' then
    ---@param each string
    for _, each in pairs(module) do
      require('plenary.reload').reload_module(each)
    end
  else
    require('plenary.reload').reload_module(module)
  end
end

---Reload module with lazy
---@param module string|table
local function reload_lazy(module)
  if type(module) == 'table' then
    ---@param each string
    for _, each in pairs(module) do
      vim.cmd('Lazy reload ' .. each)
    end
  else
    vim.cmd('Lazy reload ' .. module)
  end
end

---@param type string
local function info(type)
  vim.notify(
    type:gsub('^%l', string.upper) .. ' reloaded...',
    2,
    { title = 'Reload' }
  )
end

M.reload_transparency = function()
  reload_plenary('NEVIRAIDE')
  vim.g.transparency = NEVIRAIDE().transparency
  reload_plenary({ 'plugins.config.telescope', 'plugins.config.whichkey' })
  refresh_highlights()
  reload_lazy({ 'nvim-web-devicons', 'telescope.nvim', 'which-key.nvim' })
  vim.opt.tabline = "%!v:lua.require('neviraide-ui.buftabline.modules')()"
  info('transparency')
end

M.reload_borders = function()
  reload_plenary('NEVIRAIDE')
  vim.g.borders = NEVIRAIDE().border
  reload_plenary({
    'plugins.config.telescope',
    'plugins.config.whichkey',
    'plugins.config.lsp.mason',
    'plugins.config.lsp.options',
  })
  refresh_highlights()
  reload_lazy({
    'telescope.nvim',
    'which-key.nvim',
    'mason.nvim',
    'gitsigns.nvim',
  })
  info('borders')
end

M.reload_icons = function()
  reload_plenary('NEVIRAIDE')
  vim.g.nonicons = NEVIRAIDE().nonicons

  reload_plenary({
    'plugins.config.telescope',
    'plugins.config.whichkey',
    'plugins.config.lsp.mason',
    'plugins.config.lsp.options',
    'neviraide-ui.statusline',
    'neviraide-ui.buftabline.modules',
  })
  refresh_highlights()
  reload_lazy({
    'nvim-web-devicons',
    'telescope.nvim',
    'which-key.nvim',
    'mason.nvim',
  })

  vim.opt.statusline = "%!v:lua.require('neviraide-ui.statusline').run()"
  vim.opt.tabline = "%!v:lua.require('neviraide-ui.buftabline.modules')()"

  info('icons')
end

M.reload_config = function()
  reload_plenary('NEVIRAIDE')
  local config = NEVIRAIDE()

  vim.g.neviraide_theme = config.theme
  vim.g.transparency = config.transparency
  -- vim.g.blend = config.blend
  vim.g.borders = config.border
  vim.g.nonicons = config.nonicons
  vim.o.cursorline = config.cursor_line
  -- vim.o.pumblend = config.blend
  vim.o.cursorcolumn = config.cursor_column
  vim.o.number = config.numbers_enabled
  vim.o.relativenumber = config.relative_numbers
  vim.o.shiftwidth = config.indents
  vim.o.tabstop = config.indents
  vim.o.softtabstop = config.indents

  reload_plenary({
    'plugins.config.telescope',
    'plugins.config.whichkey',
    'plugins.config.lsp.mason',
    'plugins.config.lsp.options',
    'neviraide-ui.statusline',
    'neviraide-ui.buftabline.modules',
  })
  refresh_highlights()
  reload_lazy({
    'nvim-web-devicons',
    'telescope.nvim',
    'mason.nvim',
    'gitsigns.nvim',
  })

  vim.opt.statusline = "%!v:lua.require('neviraide-ui.statusline').run()"
  vim.opt.tabline = "%!v:lua.require('neviraide-ui.buftabline.modules')()"

  info('config')
end

return M

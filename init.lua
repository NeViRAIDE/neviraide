local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- TODO: choose best variant

---Returns all data from main
---configuration file as table.
_G.NEVIRAIDE = function()
  local neviraide_conf = vim.fn.stdpath('config') .. '/lua/' .. 'NEVIRAIDE.lua'
  local file = io.open(neviraide_conf, 'r')

  if file ~= nil then
    io.close(file)
    return require('NEVIRAIDE')
  else
    vim.notify([[

    #############################################################
    #                                                           #
    #      "NEVIRAIDE.lua" is required                          #
    #                        in your "~/.config/nvim/lua/"      #
    #                                                           #
    #############################################################
  ]])
  end
  -----------------------------------------------------------------------
  -- local ok, config = pcall(require, 'NEVIRAIDE')
  -- if ok then
  --   return config
  -- else
  --   vim.notify('ERROR: ' .. config)
  --   vim.notify([[
  --
  --   #############################################################
  --   #                                                           #
  --   #      "NEVIRAIDE.lua" is required                          #
  --   #                        in your "~/.config/nvim/lua/"      #
  --   #                                                           #
  --   #############################################################
  -- ]])
  -- end
end

vim.g.mapleader = ' '

vim.g.neviraide_themes_cache = vim.fn.stdpath('data') .. '/neviraide_ui/'
vim.g.toggle_theme_icon = '   '
vim.g.neviraide_theme = NEVIRAIDE().theme

require('neviraide.lazy')
require('neviraide.settings')

dofile(vim.g.neviraide_themes_cache .. 'defaults')

-- FIX: not markdown in float windows
local utils = require('neviraide.utils')
---Returns all data from main
---configuration file as table.
_G.NEVIRAIDE = function()
  local ok, config = pcall(require, 'NEVIRAIDE')
  if ok then
    return config
  else
    vim.notify('ERROR: ' .. config)
    vim.notify([[

    #############################################################
    #                                                           #
    #      "NEVIRAIDE.lua" is required                          #
    #                        in your "~/.config/nvim/lua/"      #
    #                                                           #
    #############################################################
  ]])
  end
end

require('neviraide.settings')

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

utils.mason_path()

require('neviraide.lazy')

utils.autocmd('ReloadNeviraide', 'BufWritePost', {
  pattern = vim.fn.stdpath('config') .. '/lua/NEVIRAIDE.lua',
  desc = 'Reload NEVIRAIDE on change some fields',
  callback = require('neviraide.utils.reload_config').reload_config,
}, true)

dofile(vim.g.neviraide_themes_cache .. 'defaults')

require('update').check_for_updates()

local utils = require('neviraide.utils')

---Returns all data from main configuration file as table.
---@return NeviraideConfig
_G.NEVIRAIDE = function()
  local ok, config = pcall(require, 'NEVIRAIDE')
  if ok then return config end
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

require('neviraide.settings')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
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

dofile(vim.g.ntc .. 'defaults')

local M = {}

local utils = require('core.utils')

function M.toggle_relative_numbers()
  local rel_nums = require('NEVIRAIDE').ui.relative_numbers
  if rel_nums == false then
    vim.opt.relativenumber = true
    utils.replace_word('relative_numbers = false', 'relative_numbers = true')
  else
    vim.opt.relativenumber = false
    utils.replace_word('relative_numbers = true', 'relative_numbers = false')
  end
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.toggle_numbers()
  local nums = require('NEVIRAIDE').ui.number
  if nums == false then
    vim.opt.number = true
    utils.replace_word('number = false', 'number = true')
  else
    vim.opt.number = false
    utils.replace_word('number = true', 'number = false')
  end
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.toggle_transparency()
  local transparency = require('NEVIRAIDE').ui.transparency
  if transparency == false then
    utils.replace_word('transparency = false', 'transparency = true')
  else
    utils.replace_word('transparency = true', 'transparency = false')
  end
  require('plenary.reload').reload_module('NEVIRAIDE')
  vim.fn.execute('TransparentToggle')
end

return M

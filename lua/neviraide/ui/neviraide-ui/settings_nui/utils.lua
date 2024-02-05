local M = {}

local popups = require('neviraide.ui.neviraide-ui.settings_nui.popups')

local function getDisplayValue(key, value)
  if key == 'theme' then
    return value or 'unknown'
  elseif key == 'borders' then
    return value or 'unknown'
  else
    return value and '✔' or '✖'
  end
end

M.formatMenuItem = function(label, value)
  local totalWidth = vim.api.nvim_win_get_width(popups.main.winid) / 2 - 4
  local displayValue = getDisplayValue(label, value)
  local displayValueWidth = vim.fn.strwidth(displayValue)
  local paddingSize = totalWidth - #label - displayValueWidth
  local padding = string.rep(' ', paddingSize)
  return label .. padding .. displayValue
end

M.formatCategoryTitle = function(title)
  local totalWidth = vim.api.nvim_win_get_width(popups.main.winid) / 2 - 4
  local textWidth = vim.fn.strwidth(title)
  local paddingSize = (totalWidth - textWidth) / 2
  local padding = string.rep(' ', paddingSize)
  return padding .. title .. padding
end

return M

local M = {}

local border_chars_list = {
  rounded = '{ "─", "│", "─", "│", "╭", "╮", "╯", "╰" }',
  single = '{ "─", "│", "─", "│", "┌", "┐", "┘", "└" }',
  double = '{ "═", "║", "═", "║", "╔", "╗", "╝", "╚" }',
  solid = '{ " ", " ", " ", " ", " ", " ", " ", " " }',
  none = '{ "", "", "", "", "", "", "", "" }',
}

---@param border 'none'|'single'|'double'|'rounded'|'solid'|'shadow'
M.set_borders = function(border)
  vim.g.b = border

  ---@type string
  local chars

  for _ in pairs(border_chars_list) do
    if border == 'shadow' then
      chars = border_chars_list.solid
    else
      chars = border_chars_list[border]
    end
  end

  local old_data_chars = "borderchars = '"
    .. tostring(NEVIRAIDE().borderchars)
    .. "'"
  local new_data_chars = "borderchars = '" .. tostring(chars) .. "'"

  local old_borders = "border = '" .. tostring(NEVIRAIDE().border) .. "'"
  local new_borders = "border = '" .. tostring(border) .. "'"

  require('neviraide.ui.neviraide-ui.utils').replace_word(
    old_borders,
    new_borders
  )
  require('neviraide.ui.neviraide-ui.utils').replace_word(
    old_data_chars,
    new_data_chars
  )
  require('plenary.reload').reload_module('NEVIRAIDE')
end

return M

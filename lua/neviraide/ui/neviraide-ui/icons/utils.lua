---@type space
local function space(spaces) return string.rep(' ', spaces or 0) end

---@type IconUtils
local M = {
  decoder = function(icon_code) return vim.fn.nr2char(tostring(icon_code)) end,
  icon = function(handle_icon, nonicon_name, space_before, space_after)
    ---@type Nonicons
    local nonicons = require('neviraide.ui.neviraide-ui.icons.nonicons')

    local icon = vim.g.n
        and nonicons[nonicon_name]
        and nonicons[nonicon_name].icon
      or handle_icon

    return space(space_before) .. icon .. space(space_after)
  end,
}

return M

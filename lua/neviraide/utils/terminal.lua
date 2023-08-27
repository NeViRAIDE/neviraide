local utils = require('neviraide.utils')

---@param direction string
local term_toggle = function(direction)
  local check =
    utils.check_missing('nvterm.terminal', 'https://github.com/NvChad/nvterm')
  if check ~= nil then
    if check['toggle'] ~= nil then return check.toggle(direction) end
  end
end

return {
  term_toggle = term_toggle,
}

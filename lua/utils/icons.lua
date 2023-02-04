---@type string
local term = vim.api.nvim_exec('echo $TERM', '')
-- TODO: best practice lua function commenting

---Setting icons depending on the terminal used.
---@param nonicon string
---@param icon string
---@param text string
function _G.icon(nonicon, icon, text)
  local ni = require('nvim-nonicons').get(nonicon)
  if term == 'xterm-kitty' then
    if ni == '' then return nonicon end
    return ni .. ' '
  elseif term == 'linux' then
    return text
  end
  return icon
end

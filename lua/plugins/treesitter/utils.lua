---@type string
local xdg_config = vim.env.XDG_CONFIG_HOME or vim.env.HOME .. '/.config'

---@param path string
local function have(path)
  return vim.uv.fs_stat(xdg_config .. '/' .. path) ~= nil
end

return { have = have }

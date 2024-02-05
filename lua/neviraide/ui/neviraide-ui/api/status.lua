local require = require('neviraide.ui.neviraide-ui.utils.lazy')

local Manager = require('neviraide.ui.neviraide-ui.message.manager')
local Config = require('neviraide.ui.neviraide-ui.config')

---@type NeviraideUIFilter
local nothing = { ['not'] = {} }

---@param str string
local function escape(str) return str:gsub('%%', '%%%%') end

---@param name string
---@return NeviraideUIStatus
local function NeviraideUIStatus(name)
  local function _get()
    if not Config.is_running() then return end
    local filter = Config.options.status[name] or nothing
    return Manager.get(filter, {
      count = 1,
      sort = true,
      history = true,
    })[1]
  end
  ---@class NeviraideUIStatus
  return {
    has = function() return _get() ~= nil end,
    get = function()
      local message = _get()
      if message then return escape(vim.trim(message:content())) end
    end,
    get_hl = function()
      local message = _get()
      if message and message._lines[1] then
        local ret = ''
        local line = message._lines[#message._lines]
        for _, text in ipairs(line._texts) do
          if text.extmark and text.extmark.hl_group then
            -- use hl_group
            ret = ret
              .. '%#'
              .. text.extmark.hl_group
              .. '#'
              .. escape(text:content())
          else
            -- or reset to StatusLine
            ret = ret .. '%#StatusLine#' .. escape(text:content())
          end
        end
        return ret
      end
    end,
  }
end

---@type table<string, NeviraideUIStatus>
local status = {}

return setmetatable(status, {
  __index = function(_, key) return NeviraideUIStatus(key) end,
})

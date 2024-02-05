local require = require('neviraide.ui.neviraide-ui.utils.lazy')

local Msg = require('neviraide.ui.neviraide-ui.ui.msg')

local M = {}

---@type table<string, NeviraideUIFilter>
M.defaults = {
  ruler = { event = Msg.events.ruler },
  message = { event = Msg.events.show },
  command = { event = Msg.events.showcmd },
  mode = { event = Msg.events.showmode },
  search = { event = Msg.events.show, kind = Msg.kinds.search_count },
}

return M

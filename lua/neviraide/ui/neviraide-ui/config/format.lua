local i = require('neviraide.ui.neviraide-ui.icons.utils').icon

local M = {}

---@type table<string, NeviraideUIFormat>
M.builtin = {
  default = { '{level} ', '{title} ', '{message}' },
  notify = { '{message}' },
  details = {
    '{level} ',
    '{date} ',
    '{event}',
    { '{kind}', before = { '.', hl_group = 'NeviraideUIFormatKind' } },
    ' ',
    '{title} ',
    '{cmdline} ',
    '{message}',
  },
  telescope = {
    '{level} ',
    '{date} ',
    '{title} ',
    '{message}',
  },
  telescope_preview = {
    '{level} ',
    '{date} ',
    '{event}',
    { '{kind}', before = { '.', hl_group = 'NeviraideUIFormatKind' } },
    '\n',
    '{title}\n',
    '\n',
    '{message}',
  },
}

---@class NeviraideUIFormatOptions
M.defaults = {
  ---@class NeviraideUIFormatOptions.debug
  debug = {
    enabled = true,
  },
  ---@class NeviraideUIFormatOptions.cmdline
  cmdline = {},
  ---@class NeviraideUIFormatOptions.level
  level = {
    hl_group = {
      trace = 'NeviraideUIFormatLevelTrace',
      debug = 'NeviraideUIFormatLevelDebug',
      info = 'NeviraideUIFormatLevelInfo',
      warn = 'NeviraideUIFormatLevelWarn',
      error = 'NeviraideUIFormatLevelError',
      off = 'NeviraideUIFormatLevelOff',
    },
    icons = {
      error = i('', 'x-circle', 0, 1),
      warn = i('', 'alert', 0, 1),
      info = i('', 'info', 0, 1),
    },
  },
  ---@class NeviraideUIFormatOptions.text
  text = {
    text = nil,
    hl_group = nil,
  },
  ---@class NeviraideUIFormatOptions.spinner
  spinner = {
    ---@type Spinner
    name = 'dots',
    hl_group = nil,
  },
  ---@class NeviraideUIFormatOptions.data
  data = {
    key = nil, -- Key in the message.opts object.
    hl_group = nil, -- Optional hl_group
  },
  ---@class NeviraideUIFormatOptions.title
  title = {
    hl_group = 'NeviraideUIFormatTitle',
  },
  ---@class NeviraideUIFormatOptions.event
  event = {
    hl_group = 'NeviraideUIFormatEvent',
  },
  ---@class NeviraideUIFormatOptions.kind
  kind = {
    hl_group = 'NeviraideUIFormatKind',
  },
  ---@class NeviraideUIFormatOptions.date
  date = {
    format = '%X', --- @see https://www.lua.org/pil/22.1.html
    hl_group = 'NeviraideUIFormatDate',
  },
  ---@class NeviraideUIFormatOptions.message
  message = {
    hl_group = nil, -- if set, then the hl_group will be used instead of the message highlights
  },
  ---@class NeviraideUIFormatOptions.confirm
  confirm = {
    hl_group = {
      choice = 'NeviraideUIFormatConfirm',
      default_choice = 'NeviraideUIFormatConfirmDefault',
    },
  },
}

return M

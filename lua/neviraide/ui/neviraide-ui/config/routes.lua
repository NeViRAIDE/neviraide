local require = require('neviraide.ui.neviraide-ui.utils.lazy')

local M = {}

---@param routes? NeviraideUIRouteConfig[]
function M.get(routes)
  ---@type NeviraideUIRouteConfig[]
  local ret = {}

  -- add custom routes
  vim.list_extend(ret, routes or {})

  -- add default routes
  vim.list_extend(ret, M.defaults())
  return ret
end

---@return NeviraideUIRouteConfig[]
function M.defaults()
  ---@type NeviraideUIRouteConfig[]
  local ret = {}

  for _, kind in ipairs({ 'signature', 'hover' }) do
    table.insert(ret, {
      view = 'hover',
      filter = { event = 'lsp', kind = kind },
      opts = vim.tbl_deep_extend('force', {}, {
        replace = true,
        render = 'plain',
        format = { '{message}' },
        win_options = { concealcursor = 'n', conceallevel = 3 },
      } or {}),
    })
  end

  return vim.list_extend(ret, {
    {
      view = 'cmdline_popup',
      opts = {},
      filter = { event = 'cmdline' },
    },
    {
      view = 'confirm',
      filter = {
        any = {
          { event = 'msg_show', kind = 'confirm' },
          { event = 'msg_show', kind = 'confirm_sub' },
          -- { event = "msg_show", kind = { "echo", "echomsg", "" }, before = true },
          -- { event = "msg_show", kind = { "echo", "echomsg" }, instant = true },
          -- { event = "msg_show", find = "E325" },
          -- { event = "msg_show", find = "Found a swap file" },
        },
      },
    },
    {
      view = 'messages',
      filter = {
        any = {
          { event = 'msg_history_show' },
          -- { min_height = 20 },
        },
      },
    },
    {
      view = 'virtualtext',
      filter = {
        event = 'msg_show',
        kind = 'search_count',
      },
    },
    {
      filter = {
        any = {
          { event = { 'msg_showmode', 'msg_showcmd', 'msg_ruler' } },
          { event = 'msg_show', kind = 'search_count' },
        },
      },
      opts = { skip = true },
    },
    {
      view = 'notify',
      filter = {
        event = 'msg_show',
        kind = { '', 'echo', 'echomsg' },
      },
      opts = { replace = true, merge = true, title = 'Messages' },
    },
    {
      view = 'notify',
      filter = { error = true },
      opts = { title = 'Error' },
    },
    {
      view = 'notify',
      filter = { warning = true },
      opts = { title = 'Warning' },
    },
    {
      view = 'notify',
      filter = { event = 'notify' },
      opts = { title = 'Notify' },
    },
    {
      view = 'notify',
      filter = {
        event = 'neviraide-ui',
        kind = { 'stats', 'debug' },
      },
      opts = { lang = 'lua', replace = true, title = 'NeviraideUI' },
    },
    {
      view = 'notify',
      opts = {},
      filter = { event = 'lsp', kind = 'message' },
    },
  })
end

return M

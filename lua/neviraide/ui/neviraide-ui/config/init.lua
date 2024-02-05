local require = require('neviraide.ui.neviraide-ui.utils.lazy')

local Routes = require('neviraide.ui.neviraide-ui.config.routes')

local M = {}

M.ns = vim.api.nvim_create_namespace('neviraide-ui')

function M.defaults()
  ---@class NeviraideUIConfig
  local defaults = {
    cmdline = { enabled = true },
    messages = { enabled = true },
    popupmenu = { enabled = true, backend = 'nui' },
    ---@type NeviraideUIRouteConfig
    redirect = {
      view = 'popup',
      filter = { event = 'msg_show' },
    },
    notify = { view = 'notify' },
    markdown = {},
    smart_move = {
      enabled = true,
      excluded_filetypes = { 'cmp_menu', 'cmp_docs', 'notify' },
    },
    throttle = 1000 / 30,
    ---@type NeviraideUIConfigViews
    views = {}, ---@see section on views
    ---@type NeviraideUIRouteConfig[]
    routes = {}, --- @see section on routes
    ---@type table<string, NeviraideUIFilter>
    status = {}, --- @see section on statusline components
    ---@type NeviraideUIFormatOptions
    format = {}, --- @see section on formatting
    debug = false,
    log = vim.fn.stdpath('state') .. '/neviraide-ui.log',
    log_max_size = 1024 * 1024 * 2, -- 10MB
  }
  return defaults
end

---@type NeviraideUIConfig
M.options = {}

M._running = false
function M.is_running() return M._running end

function M.setup(options)
  options = options or {}

  if options.popupmenu and options.popupmenu.kind_icons == true then
    options.popupmenu.kind_icons = nil
  end

  M.options = vim.tbl_deep_extend('force', {}, M.defaults(), {
    views = require('neviraide.ui.neviraide-ui.config.views').defaults,
    status = require('neviraide.ui.neviraide-ui.config.status').defaults,
    format = require('neviraide.ui.neviraide-ui.config.format').defaults,
    popupmenu = { kind_icons = require('neviraide.utils').icons().lspkind },
  })

  M.truncate_log()

  local routes = M.options.routes
  M.options = vim.tbl_deep_extend('force', M.options, options)
  vim.list_extend(M.options.routes, routes)

  if M.options.popupmenu.kind_icons == false then
    M.options.popupmenu.kind_icons = {}
  end

  require('neviraide.ui.neviraide-ui.config.cmdline').setup()

  M.options.routes = Routes.get(M.options.routes)

  require('neviraide.ui.neviraide-ui.config.highlights').setup()
  vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function()
      require('neviraide.ui.neviraide-ui.config.highlights').setup()
    end,
  })

  require('neviraide.ui.neviraide-ui.lsp').setup()
  M._running = true
end

function M.truncate_log()
  local stat = vim.uv.fs_stat(M.options.log)
  if stat and stat.size > M.options.log_max_size then
    io.open(M.options.log, 'w+'):close()
  end
end

return M

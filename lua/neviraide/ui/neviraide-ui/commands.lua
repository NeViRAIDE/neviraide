local require = require('neviraide.ui.neviraide-ui.utils.lazy')

local View = require('neviraide.ui.neviraide-ui.view')
local Manager = require('neviraide.ui.neviraide-ui.message.manager')
local Options = require('neviraide.ui.neviraide-ui.config').options
local Util = require('neviraide.ui.neviraide-ui.utils')
local Message = require('neviraide.ui.neviraide-ui.message')
local Router = require('neviraide.ui.neviraide-ui.message.router')

---@class NeviraideUICommand: NeviraideUIRouteConfig
---@field filter_opts NeviraideUIMessageOpts

local commands = {
  history = {
    -- options for the message history that you get with `:NeviraideUI`
    view = 'split',
    opts = { enter = true, format = 'details' },
    filter = {
      any = {
        { event = 'notify' },
        { error = true },
        { warning = true },
        { event = 'msg_show', kind = { '' } },
        { event = 'lsp', kind = 'message' },
      },
    },
  },
  -- :NeviraideUI last
  last = {
    view = 'popup',
    opts = { enter = true, format = 'details' },
    filter = {
      any = {
        { event = 'notify' },
        { error = true },
        { warning = true },
        { event = 'msg_show', kind = { '' } },
        { event = 'lsp', kind = 'message' },
      },
    },
    filter_opts = { count = 1 },
  },
  -- :NeviraideUI errors
  errors = {
    view = 'popup',
    opts = { enter = true, format = 'details' },
    filter = { error = true },
    filter_opts = { reverse = true },
  },
}

local M = {}

---@type table<string, fun()>
M.commands = {}

---@param command NeviraideUICommand
function M.command(command)
  return function()
    local view = View.get_view(command.view, command.opts)
    view:set(Manager.get(
      command.filter,
      vim.tbl_deep_extend('force', {
        history = true,
        sort = true,
      }, command.filter_opts or {})
    ))
    view:display()
  end
end

function M.cmd(cmd)
  if M.commands[cmd] then
    M.commands[cmd]()
  else
    M.commands.history()
  end
end

function M.setup()
  M.commands = {
    dashboard = function()
      if vim.g.neviraide_dashboard_displayed then
        require('neviraide.ui.neviraide-ui.buftabline').close_buffer()
      else
        require('neviraide.ui.neviraide-ui.dashboard').open()
      end
    end,
    debug = function() Options.debug = not Options.debug end,
    dismiss = function() Router.dismiss() end,
    log = function() vim.cmd.edit(Options.log) end,
    enable = function() require('neviraide.ui.neviraide-ui').enable() end,
    disable = function() require('neviraide.ui.neviraide-ui').disable() end,
    stats = function() Manager.add(Util.stats.message()) end,
    cursorcolumn = function() Util.settings('cursorcolumn').toggle() end,
    cursorline = function() Util.settings('cursorline').toggle() end,
    numbers = function() Util.settings('numbers').toggle() end,
    relativenumbers = function() Util.settings('relativenumbers').toggle() end,
    transparency = function()
      Util.settings('transparency').toggle()
      require('neviraide.utils.reload_config').reload_transparency()
    end,
    routes = function()
      local message = Message('neviraide.ui.neviraide-ui', 'debug')
      message:set(vim.inspect(Options.routes))
      Manager.add(message)
    end,
    config = function()
      local message = Message('neviraide.ui.neviraide-ui', 'debug')
      message:set(vim.inspect(Options))
      Manager.add(message)
    end,
    viewstats = function()
      local message = Message('neviraide.ui.neviraide-ui', 'debug')
      message:set(
        vim.inspect(
          require('neviraide.ui.neviraide-ui.message.router').view_stats()
        )
      )
      Manager.add(message)
    end,
  }

  for name, command in pairs(commands) do
    M.commands[name] = M.command(command)
  end

  vim.api.nvim_create_user_command('NeviraideUI', function(args)
    local cmd = vim.trim(args.args or '')
    M.cmd(cmd)
  end, {
    nargs = '?',
    desc = 'NeviraideUI',
    complete = function(_, line)
      if line:match('^%s*NeviraideUI %w+ ') then return {} end
      local prefix = line:match('^%s*NeviraideUI (%w*)') or ''
      return vim.tbl_filter(
        function(key) return key:find(prefix) == 1 end,
        vim.tbl_keys(M.commands)
      )
    end,
  })

  for name in pairs(M.commands) do
    local cmd = 'NeviraideUI' .. name:sub(1, 1):upper() .. name:sub(2)
    vim.api.nvim_create_user_command(
      cmd,
      function() M.cmd(name) end,
      { desc = 'NeviraideUI ' .. name }
    )
  end
end

return M

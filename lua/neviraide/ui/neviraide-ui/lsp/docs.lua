local require = require('neviraide.ui.neviraide-ui.utils.lazy')

local Manager = require('neviraide.ui.neviraide-ui.message.manager')
local Util = require('neviraide.ui.neviraide-ui.utils')
local Message = require('neviraide.ui.neviraide-ui.message')

local M = {}

---@type table<LspKind, NeviraideUIMessage>
M._messages = {}

---@type number?
M._autohide = nil

function M.autohide()
  if not M._autohide then
    M._autohide = vim.api.nvim_create_autocmd(
      { 'CursorMoved', 'CursorMovedI', 'InsertEnter' },
      {
        group = vim.api.nvim_create_augroup(
          'neviraide_ui_lsp_docs',
          { clear = true }
        ),
        callback = function() vim.defer_fn(M.on_close, 10) end,
      }
    )
  end
end

---@param kind LspKind
function M.get(kind)
  if not M._messages[kind] then
    M._messages[kind] = Message('lsp', kind)
    M._messages[kind].opts.title = kind
  end
  M._messages[kind]:clear()
  return M._messages[kind]
end

function M.on_close()
  for _, message in pairs(M._messages) do
    -- close the message if we're not in it's buffer (focus)
    local keep = message:on_buf(vim.api.nvim_get_current_buf())
      or (message.opts.stay and message.opts.stay())
    if not keep then M.hide(message) end
  end
end

function M.scroll(delta)
  for _, kind in ipairs({ 'hover', 'signature' }) do
    local message = M.get(kind)
    local win = message:win()
    if win then
      Util.nui.scroll(win, delta)
      return true
    end
  end
end

---@param message NeviraideUIMessage
function M.hide(message)
  message.opts.keep = function() return false end
  Manager.remove(message)
end

---@param message NeviraideUIMessage
---@param stay? fun():boolean
function M.show(message, stay)
  M.autohide()
  message.opts.timeout = 100
  message.opts.keep = function() return true end
  message.opts.stay = stay
  for _, m in pairs(M._messages) do
    if m ~= message then M.hide(m) end
  end
  Manager.add(message)
end

return M

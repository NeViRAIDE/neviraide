local require = require('neviraide.ui.neviraide-ui.utils.lazy')

local Block = require('neviraide.ui.neviraide-ui.text.block')
local Filter = require('neviraide.ui.neviraide-ui.message.filter')

local _id = 0

---@class NeviraideUIMessage: NeviraideUIBlock
---@field super NeviraideUIBlock
---@field id number
---@field event NeviraideUIEvent
---@field ctime number
---@field mtime number
---@field tick number
---@field level? NotifyLevel
---@field kind? NeviraideUIKind
---@field cmdline? NeviraideUICmdline
---@field _debug? boolean
---@field opts table<string, any>
---@overload fun(event: NeviraideUIEvent, kind?: NeviraideUIKind, content?: NeviraideUIContent|NeviraideUIContent[]): NeviraideUIMessage
---@diagnostic disable-next-line: undefined-field
local Message = Block:extend('NeviraideUIBlock')

---@param event NeviraideUIEvent
---@param kind? NeviraideUIKind
---@param content? NeviraideUIContent|NeviraideUIContent[]
function Message:init(event, kind, content)
  _id = _id + 1
  self.id = _id
  self.tick = 1
  self.ctime = vim.fn.localtime()
  self.mtime = vim.fn.localtime()
  self.event = event
  self.kind = kind
  self.opts = {}
  Message.super.init(self, content)
end

-- Returns the first buffer that has rendered the message
---@return buffer?
function Message:buf() return self:bufs()[1] end

function Message:bufs()
  return vim.tbl_filter(
    function(buf) return vim.api.nvim_buf_is_valid(buf) and self.on_buf(buf) end,
    vim.api.nvim_list_bufs()
  )
end

function Message:wins()
  return vim.tbl_filter(
    function(win) return vim.api.nvim_win_is_valid(win) and self:on_win(win) end,
    vim.api.nvim_list_wins()
  )
end

-- Returns the first window that displays the message
---@return window?
function Message:win() return self:wins()[1] end

function Message:focus()
  local win = self:win()
  if win then
    vim.api.nvim_set_current_win(win)
    -- switch to normal mode
    vim.cmd('stopinsert')
    return true
  end
end

function Message:on_remove()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if self:on_buf(buf) then
      vim.b[buf].messages = vim.tbl_filter(
        function(b) return b ~= buf end,
        vim.b[buf].messages
      )
    end
  end
end

function Message:on_win(win) return self:on_buf(vim.api.nvim_win_get_buf(win)) end

function Message:on_buf(buf)
  return vim.b[buf].messages and vim.tbl_contains(vim.b[buf].messages, self.id)
end

function Message:_add_buf(buf)
  local bufs = vim.b[buf].messages or {}
  table.insert(bufs, self.id)
  vim.b[buf].messages = bufs
end

---@param bufnr number buffer number
---@param ns_id number namespace id
---@param linenr_start? number line number (1-indexed)
function Message:highlight(bufnr, ns_id, linenr_start)
  self:_add_buf(bufnr)
  return Message.super.highlight(self, bufnr, ns_id, linenr_start)
end

---@param bufnr number buffer number
---@param ns_id number namespace id
---@param linenr_start? number start line number (1-indexed)
---@param linenr_end? number end line number (1-indexed)
function Message:render(bufnr, ns_id, linenr_start, linenr_end)
  self:_add_buf(bufnr)
  return Message.super.render(self, bufnr, ns_id, linenr_start, linenr_end)
end

Message.is = Filter.is

return Message

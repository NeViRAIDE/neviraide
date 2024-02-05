local require = require('neviraide.ui.neviraide-ui.utils.lazy')

local Util = require('neviraide.ui.neviraide-ui.utils')
local NeviraideUIText = require('neviraide.ui.neviraide-ui.text')

local M = {}

---@param message NeviraideUIMessage
---@param input NeviraideUIMessage
---@param opts NeviraideUIFormatOptions.message
function M.message(message, opts, input)
  if opts.hl_group then
    message:append(input:content(), opts.hl_group)
  else
    message:append(input)
  end
end

---@param message NeviraideUIMessage
---@param opts NeviraideUIFormatOptions.text
function M.text(message, opts)
  if opts.text and opts.text ~= '' then
    message:append(opts.text, opts.hl_group)
  end
end

---@param message NeviraideUIMessage
---@param opts NeviraideUIFormatOptions.progress
function M.progress(message, opts)
  local contents = require('neviraide.ui.neviraide-ui.text.format').format(
    message,
    opts.contents,
    {
      debug = { enabled = false },
    }
  )
  local value = vim.tbl_get(
    message.opts,
    unpack(vim.split(opts.key, '.', { plain = true }))
  )
  if type(value) == 'number' then
    local width = math.max(opts.width, contents:width() + 2)

    local done_length = math.floor(value / 100 * width + 0.5)
    local todo_length = width - done_length

    if opts.align == 'left' then message:append(contents) end

    if width > contents:width() then
      message:append(string.rep(' ', width - contents:width()))
    end

    if opts.align == 'right' then message:append(contents) end

    message:append(NeviraideUIText('', {
      hl_group = opts.hl_group_done,
      hl_mode = 'replace',
      relative = true,
      col = -width,
      length = done_length,
    }))
    message:append(NeviraideUIText('', {
      hl_group = opts.hl_group,
      hl_mode = 'replace',
      relative = true,
      col = -width + done_length,
      length = todo_length,
    }))
  else
    message:append(contents)
  end
end

---@param message NeviraideUIMessage
---@param opts NeviraideUIFormatOptions.level
function M.level(message, opts)
  if message.level then
    local str = message.level:sub(1, 1):upper() .. message.level:sub(2)
    if opts.icons and opts.icons[message.level] then
      str = opts.icons[message.level] .. ' ' .. str
    end
    message:append(' ' .. str .. ' ', opts.hl_group[message.level])
  end
end

---@param message NeviraideUIMessage
---@param opts NeviraideUIFormatOptions.kind
function M.kind(message, opts)
  if message.kind and message.kind ~= '' then
    message:append(message.kind, opts.hl_group)
  end
end

---@param message NeviraideUIMessage
---@param opts NeviraideUIFormatOptions.title
function M.title(message, opts)
  if message.opts.title then
    message:append(message.opts.title, opts.hl_group)
  end
end
---@param message NeviraideUIMessage
---@param opts NeviraideUIFormatOptions.event
function M.event(message, opts)
  if message.event then message:append(message.event, opts.hl_group) end
end

---@param message NeviraideUIMessage
---@param opts NeviraideUIFormatOptions.date
function M.date(message, opts)
  message:append(os.date(opts.format, message.ctime), opts.hl_group)
end

---@param message NeviraideUIMessage
---@param opts NeviraideUIFormatOptions.debug
function M.debug(message, opts)
  if not opts.enabled then return end
  local blocking, reason = Util.is_blocking()
  local debug = {
    message:is({ cleared = true }) and ' ' or ' ',
    '#' .. message.id,
    message.event
      .. (message.kind and message.kind ~= '' and ('.' .. message.kind) or ''),
    blocking and '⚡ ' .. reason,
  }
  message:append(
    NeviraideUIText.virtual_text(' ' .. table.concat(
      vim.tbl_filter(
        ---@param t string
        function(t) return type(t) == 'string' end,
        debug
      ),
      ' '
    ) .. ' ', 'DiagnosticVirtualTextInfo')
  )
  if message.event == 'cmdline' then
    message:newline()
  else
    message:append(' ')
  end
end

---@param message NeviraideUIMessage
---@param opts NeviraideUIFormatOptions.data
function M.data(message, opts)
  local value = vim.tbl_get(
    message.opts,
    unpack(vim.split(opts.key, '.', { plain = true }))
  )
  if value then message:append('' .. value, opts.hl_group) end
end

---@param message NeviraideUIMessage
---@param opts NeviraideUIFormatOptions.spinner
function M.spinner(message, opts)
  message:append(
    require('neviraide.ui.neviraide-ui.utils.spinners').spin(opts.name),
    opts.hl_group
  )
end

---@param message NeviraideUIMessage
---@param _opts NeviraideUIFormatOptions.cmdline
function M.cmdline(message, _opts)
  if message.cmdline then message.cmdline:format(message, true) end
end

---@param message NeviraideUIMessage
---@param input NeviraideUIMessage
---@param opts NeviraideUIFormatOptions.confirm
function M.confirm(message, opts, input)
  if message.kind ~= 'confirm' then return message:append(input) end
  for l, line in ipairs(input._lines) do
    if l ~= #input._lines then
      message:append(line)
      message:newline()
    end
  end
  message:trim_empty_lines()
  message:newline()
  message:newline()
  local _, _, buttons = input:last_line():content():find('(.*):')
  if buttons then
    buttons = vim.split(buttons, ', ')

    for b, button in ipairs(buttons) do
      local hl_group = button:find('%[') and opts.hl_group.default_choice
        or opts.hl_group.choice
      message:append(' ' .. button .. ' ', hl_group)
      if b ~= #buttons then message:append(' ') end
    end

    local padding =
      math.floor((message:width() - message:last_line():width()) / 2)
    table.insert(
      message:last_line()._texts,
      1,
      NeviraideUIText((' '):rep(padding))
    )
  end
end

return M

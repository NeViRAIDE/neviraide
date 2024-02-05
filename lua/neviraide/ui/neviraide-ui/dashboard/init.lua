-- FIX: show bufferline when dashboard opened if more than one window already opened
-- TODO: separate file

local autocmd = require('neviraide.utils').autocmd
local M = {}
local api = vim.api
local fn = vim.fn

dofile(vim.g.ntc .. 'dashboard')

local raw_height = 1
local pointer =
  require('neviraide.ui.neviraide-ui.icons.utils').icon('', 'dot-fill', 0, 1)

local buttons = require('neviraide.ui.neviraide-ui.dashboard.buttons')
local headers = require('neviraide.ui.neviraide-ui.dashboard.ascii')

local headerAscii = headers.long

local emmptyLine = string.rep(' ', vim.fn.strwidth(headerAscii[1]))

table.insert(headerAscii, 1, emmptyLine)
table.insert(headerAscii, 2, emmptyLine)

headerAscii[#headerAscii + 1] = emmptyLine
headerAscii[#headerAscii + 1] = emmptyLine

autocmd('NEVIRAIDE_dashbufleave', 'BufLeave', {
  callback = function()
    if vim.bo.ft == 'neviraideDashboard' then
      vim.g.neviraide_dashboard_displayed = false
    end
  end,
})

local neviraideDashboardWidth = #headerAscii[8] + 4

local max_height = #headerAscii + 4 + (2 * #buttons) -- 4  = extra spaces i.e top/bottom
local get_win_height = api.nvim_win_get_height

local function nvim_version()
  local nvim_full_version_info = vim.fn.execute('version')
  if nvim_full_version_info:match('NVIM') then
    return nvim_full_version_info:match('NVIM [^\n]*')
  else
    return 'Check your configuration'
  end
end

M.open = function()
  vim.g.nv_previous_buf = vim.api.nvim_get_current_buf()

  local buf = vim.api.nvim_create_buf(false, true)
  local win = api.nvim_get_current_win()

  if neviraideDashboardWidth + 6 > api.nvim_win_get_width(0) then
    local wins = api.nvim_list_wins()
    if #wins > 1 then
      vim.api.nvim_set_current_win(wins[2])
      win = api.nvim_get_current_win()
    end
  end

  api.nvim_win_set_buf(win, buf)

  vim.opt_local.filetype = 'neviraideDashboard'
  vim.g.neviraide_dashboard_displayed = true

  local header = headerAscii

  local win_width = api.nvim_win_get_width(win)

  local function getMaxWidthOfLong()
    local max_len = 0
    for _, val in ipairs(headers.long) do
      local len = vim.fn.strwidth(val)
      if len > max_len then max_len = len end
    end
    return max_len
  end

  local SOME_THRESHOLD = getMaxWidthOfLong()

  if win_width < SOME_THRESHOLD then
    header = headers.short
  else
    header = headers.long
  end

  local function addSpacing_toBtns(txt1, txt2)
    local btn_len = fn.strwidth(txt1) + fn.strwidth(txt2)
    local spacing = 24 - btn_len
    return txt1 .. string.rep(' ', spacing - 1) .. txt2 .. ' '
  end

  local function addPadding_toHeader(str)
    local pad = (api.nvim_win_get_width(win) - fn.strwidth(str)) / 2
    return string.rep(' ', math.floor(pad)) .. str .. ' '
  end

  local dashboard = {}

  for _, val in ipairs(header) do
    table.insert(dashboard, val)
  end

  for _, val in ipairs(buttons) do
    table.insert(dashboard, addSpacing_toBtns(pointer .. val[1], val[2]) .. ' ')
    for i = 1, raw_height - 1 do
      table.insert(dashboard, header[1] .. ' ')
    end
  end

  table.insert(dashboard, '')
  table.insert(dashboard, '')
  table.insert(dashboard, '')
  table.insert(dashboard, nvim_version())

  local result = {}

  -- make all lines available
  for i = 1, math.max(get_win_height(win), max_height) do
    result[i] = ''
  end

  local headerStart_Index = math.abs(
    math.floor((get_win_height(win) / 2) - (#dashboard / 2))
  ) + 1 -- 1 = To handle zero case
  local abc = math.abs(math.floor((get_win_height(win) / 2) - (#dashboard / 2)))
    + 1 -- 1 = To handle zero case

  -- set ascii
  for _, val in ipairs(dashboard) do
    result[headerStart_Index] = addPadding_toHeader(val)
    headerStart_Index = headerStart_Index + 1
  end

  api.nvim_buf_set_lines(buf, 0, -1, false, result)

  local neviraideDashboard = api.nvim_create_namespace('neviraideDashboard')
  local horiz_pad_index = math.floor(
    (api.nvim_win_get_width(win) / 2) - (neviraideDashboardWidth / 2)
  ) - 3

  horiz_pad_index = math.max(horiz_pad_index, 0)

  for i = abc, abc + #header - 2 do
    local max_col = api.nvim_buf_get_lines(buf, i, i + 1, false)[1]:len()
    if horiz_pad_index < max_col and horiz_pad_index >= 0 then
      api.nvim_buf_add_highlight(
        buf,
        neviraideDashboard,
        'NeviraideDashboardAscii',
        i,
        horiz_pad_index,
        -1
      )
    end
  end

  for i = abc + #header - 1, abc + #dashboard do
    local max_col = api.nvim_buf_get_lines(buf, i, i + 1, false)[1]:len()
    if horiz_pad_index < max_col and horiz_pad_index >= 0 then
      api.nvim_buf_add_highlight(
        buf,
        neviraideDashboard,
        'NeviraideDashboardButtons',
        i,
        horiz_pad_index,
        -1
      )
    end
  end

  for i = abc + #dashboard - 2, abc + #dashboard do
    local max_col = api.nvim_buf_get_lines(buf, i, i + 1, false)[1]:len()
    if horiz_pad_index < max_col and horiz_pad_index >= 0 then
      api.nvim_buf_add_highlight(
        buf,
        neviraideDashboard,
        'NeviraideDashboardVimver',
        i,
        horiz_pad_index,
        -1
      )
    end
  end

  local target_line = abc + #header
  local max_line = api.nvim_buf_line_count(buf)
  if target_line <= max_line then
    api.nvim_win_set_cursor(
      win,
      { target_line, math.floor(vim.o.columns / 2) - 12 }
    )
  end

  local first_btn_line = abc + #header + raw_height
  local keybind_lineNrs = {}

  for _, _ in ipairs(buttons) do
    table.insert(keybind_lineNrs, first_btn_line - raw_height)
    first_btn_line = first_btn_line + raw_height
  end

  vim.keymap.set('n', 'h', '', { buffer = true })
  vim.keymap.set('n', 'l', '', { buffer = true })
  vim.keymap.set('n', '<Left>', '', { buffer = true })
  vim.keymap.set('n', '<Right>', '', { buffer = true })
  vim.keymap.set('n', '<Up>', '', { buffer = true })
  vim.keymap.set('n', '<Down>', '', { buffer = true })
  vim.keymap.set('n', 'gg', '', { buffer = true })
  vim.keymap.set('n', 'G', '', { buffer = true })

  vim.keymap.set('n', 'k', function()
    local cur = fn.line('.')
    target_line = cur == keybind_lineNrs[1]
        and keybind_lineNrs[#keybind_lineNrs]
      or cur - raw_height
    api.nvim_win_set_cursor(
      win,
      { target_line, math.floor(vim.o.columns / 2) - 12 }
    )
  end, { buffer = true })

  vim.keymap.set('n', 'j', function()
    local cur = fn.line('.')
    target_line = cur == keybind_lineNrs[#keybind_lineNrs]
        and keybind_lineNrs[1]
      or cur + raw_height
    api.nvim_win_set_cursor(
      win,
      { target_line, math.floor(vim.o.columns / 2) - 12 }
    )
  end, { buffer = true })

  -- pressing enter on
  vim.keymap.set('n', '<CR>', function()
    for i, val in ipairs(keybind_lineNrs) do
      if val == fn.line('.') then
        local action = buttons[i][3]

        if type(action) == 'string' then
          vim.cmd(action)
        elseif type(action) == 'function' then
          action()
        end
      end
    end
  end, { buffer = true })

  -- buf only options
  vim.opt_local.bufhidden = 'wipe'
  vim.opt_local.buflisted = false
  vim.opt_local.matchpairs = ''
  vim.opt_local.swapfile = false
  vim.opt_local.buftype = 'nofile'
  vim.opt_local.synmaxcol = 0
  vim.opt_local.wrap = false
  vim.opt_local.foldlevel = 999
  vim.opt_local.foldcolumn = '0'
  vim.opt_local.cursorcolumn = false
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.opt_local.list = false
  vim.opt_local.spell = false
  vim.opt_local.signcolumn = 'no'
  vim.opt_local.modifiable = false

  vim.opt_local.colorcolumn = ''
  vim.opt_local.colorcolumn = '0'
end

return M

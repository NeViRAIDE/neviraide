local api = vim.api
local fn = vim.fn
local utils = require('neviraide.ui.neviraide-ui.buftabline.modules.utils')
local icon = require('neviraide.ui.neviraide-ui.icons.utils').icon

local M = {}

vim.g.TbDatetimeToggled = 0

M.toggle_datetime = function()
  if vim.g.TbDatetimeToggled == 0 then
    vim.g.TbDatetimeToggled = 1
  else
    vim.g.TbDatetimeToggled = 0
  end
  vim.cmd('redrawtabline')
end

-- Define a function to display the date and time in the status line
---@return string
M.datetime = function()
  local current_time = os.date('%H:%M')
  local current_date = os.date('%A, %d %B %Y')

  return vim.g.TbDatetimeToggled == 1
      and '%#BufTabDate#' .. '%@ToggleDatetime@' .. icon('', 'clock', 0, 2) .. current_time .. ',' .. icon(
        '',
        'calendar',
        1,
        2
      ) .. current_date .. ' %X'
    or '%#BufTabDate#'
      .. '%@ToggleDatetime@'
      .. icon('', 'clock', 0, 2)
      .. current_time
      .. ' %X'
end

M.NeoTreeOverlay = function()
  return '%#NeoTreeNormal#'
    .. (
      vim.g.neotree_side == 'right' and ''
      or string.rep(' ', utils.getNeoTreeWidth())
    )
end

M.bufferlist = function()
  local buffers = {} -- buffersults
  local available_space = vim.o.columns
    - utils.getNeoTreeWidth()
    - utils.getBtnsWidth()
    - utils.getDatetimeWidth()
  local current_buf = api.nvim_get_current_buf()
  local has_current = false -- have we seen current buffer yet?

  for _, bufnr in ipairs(vim.t.bufs) do
    if utils.isBufValid(bufnr) then
      if ((#buffers + 1) * 21) > available_space then
        if has_current then break end

        table.remove(buffers, 1)
      end

      has_current = (bufnr == current_buf and true) or has_current
      table.insert(buffers, utils.styleBufferTab(bufnr))
    end
  end

  vim.g.visibuffers = buffers
  return table.concat(buffers) .. '%#TblineFill#' .. '%=' -- buffers + empty space
end

vim.g.TbTabsToggled = 0

M.toggle_tabs = function()
  if vim.g.TbTabsToggled == 0 then
    vim.g.TbTabsToggled = 1
  else
    vim.g.TbTabsToggled = 0
  end
  vim.cmd('redrawtabline')
end

local tab_titles = {}

M.setTabTitle = function(title)
  local tab_number = vim.api.nvim_get_current_tabpage()
  tab_titles[tab_number] = title
  vim.cmd('redrawtabline')
end

M.tablist = function()
  local result, number_of_tabs = '', fn.tabpagenr('$')

  if number_of_tabs > 1 then
    for i = 1, number_of_tabs, 1 do
      local tab_title = tab_titles[i] or tostring(i) -- Используйте название вкладки или номер, если название не установлено
      local tab_hl = ((i == fn.tabpagenr()) and '%#TbLineTabOn# ')
        or '%#TbLineTabOff# '
      result = result
        .. ('%' .. i .. '@TbGotoTab@' .. tab_hl .. tab_title .. ' ') -- Используйте tab_title вместо i
      -- Остальной код остаётся без изменений
      result = (
        i == fn.tabpagenr()
        and result
          .. '%#TbLineTabCloseBtn#'
          .. '%@TbTabClose@'
          .. '󰅙 '
          .. '%X'
      ) or result
    end

    local new_tabtn = '%#TblineTabNewBtn#'
      .. '%@TbNewTab@'
      .. icon('', 'plus', 1, 1)
      .. '%X'
    local tabstoggleBtn = '%@TbToggleTabs@ %#TBTabTitle# TABS %X'

    return vim.g.TbTabsToggled == 1
        and tabstoggleBtn:gsub('()', { [36] = icon('󱎼', 'pin', 0, 2) })
      or new_tabtn .. tabstoggleBtn .. result
  end

  return ''
end

M.buttons = function()
  local CloseAllBufsBtn = '%@TbCloseAllBufs@%#TbLineCloseAllBufsBtn#'
    .. icon('', 'x', 1, 2)
    .. '%X'
  return CloseAllBufsBtn
end

return M

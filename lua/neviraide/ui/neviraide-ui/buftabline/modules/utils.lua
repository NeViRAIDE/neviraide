local api = vim.api
local devicons_present, devicons = pcall(require, 'nvim-web-devicons')
local fn = vim.fn
local icon_plug = require('neviraide.ui.neviraide-ui.icons.utils').icon

local M = {}

M.isBufValid = function(bufnr)
  return vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted
end

M.new_hl = function(group1, group2)
  if group1 == nil then group1 = '' end
  local fg = fn.synIDattr(fn.synIDtrans(fn.hlID(group1)), 'fg#')
  local bg = fn.synIDattr(fn.synIDtrans(fn.hlID(group2)), 'bg#')
  api.nvim_set_hl(0, 'Tbline' .. group1 .. group2, { fg = fg, bg = bg })
  return '%#' .. 'Tbline' .. group1 .. group2 .. '#'
end

M.getNeoTreeWidth = function()
  for _, win in pairs(api.nvim_tabpage_list_wins(0)) do
    if vim.bo[api.nvim_win_get_buf(win)].ft == 'neo-tree' then
      return api.nvim_win_get_width(win) + 1
    end
  end
  return 0
end

M.getBtnsWidth = function()
  local width = 6
  if fn.tabpagenr('$') ~= 1 then
    width = width + ((3 * fn.tabpagenr('$')) + 2) + 10
    width = not vim.g.TbTabsToggled and 8 or width
  end
  return width
end

M.getDatetimeWidth = function(full)
  local width = 0

  -- Check if full date and time are displayed
  if full == nil then full = true end

  if full then
    -- Calculate the width when full date and time are displayed
    width = width + string.len('') -- Icon for clock
    width = width + string.len(tostring(os.date('%H:%M'))) -- Current time
    width = width + 2 -- Comma and space
    width = width + string.len('') -- Icon for calendar
    width = width + string.len(tostring(os.date('%A, %d %B %Y'))) -- Current date
    width = width + 1 -- Space at the end
  else
    -- Calculate the width when only time is displayed
    width = width + string.len('') -- Icon for clock
    width = width + string.len(tostring(os.date('%H:%M'))) -- Current time
    width = width + 1 -- Space at the end
  end

  return width
end

M.add_fileInfo = function(name, bufnr)
  if devicons_present then
    local icon, icon_hl = devicons.get_icon(name, string.match(name, '%a+$'))

    if not icon then
      icon = icon_plug('', 'file', 0, 0)
      icon_hl = 'DevIconDefault'
    end

    icon = (
      api.nvim_get_current_buf() == bufnr
        and M.new_hl(icon_hl, 'TbLineBufOn') .. ' ' .. icon
      or M.new_hl(icon_hl, 'TbLineBufOff') .. ' ' .. icon
    )

    -- check for same buffer names under different dirs
    for _, value in ipairs(vim.t.bufs) do
      if M.isBufValid(value) then
        if
          name == fn.fnamemodify(api.nvim_buf_get_name(value), ':t')
          and value ~= bufnr
        then
          local other = {}
          for match in
            (vim.fs.normalize(api.nvim_buf_get_name(value)) .. '/'):gmatch(
              '(.-)' .. '/'
            )
          do
            table.insert(other, match)
          end

          local current = {}
          for match in
            (vim.fs.normalize(api.nvim_buf_get_name(bufnr)) .. '/'):gmatch(
              '(.-)' .. '/'
            )
          do
            table.insert(current, match)
          end

          name = current[#current]

          for i = #current - 1, 1, -1 do
            local value_current = current[i]
            local other_current = other[i]

            if value_current ~= other_current then
              if (#current - i) < 2 then
                name = value_current .. '/' .. name
              else
                name = value_current .. '/../' .. name
              end
              break
            end
          end
          break
        end
      end
    end

    -- padding around bufname; 24 = bufame length (icon + filename)
    local padding = (24 - #name - 5) / 2
    local maxname_len = 16

    name = (#name > maxname_len and string.sub(name, 1, 14) .. '..') or name
    name = (api.nvim_get_current_buf() == bufnr and '%#TbLineBufOn# ' .. name)
      or ('%#TbLineBufOff# ' .. name)

    return string.rep(' ', padding)
      .. icon
      .. ' '
      .. name
      .. string.rep(' ', padding)
  end
end

M.styleBufferTab = function(nr)
  local close_btn = '%'
    .. nr
    .. '@TbKillBuf@'
    .. icon_plug('󰅖', 'x', 0, 2)
    .. '%X'
  local name = (#api.nvim_buf_get_name(nr) ~= 0)
      and fn.fnamemodify(api.nvim_buf_get_name(nr), ':t')
    or ' No Name '
  name = '%' .. nr .. '@TbGoToBuf@' .. M.add_fileInfo(name, nr) .. '%X'

  -- color close btn for focused / hidden  buffers
  if nr == api.nvim_get_current_buf() then
    close_btn = (
      vim.bo[0].modified
      and '%'
        .. nr
        .. '@TbKillBuf@%#TbLineBufOnModified#'
        .. icon_plug('', 'pencil', 0, 2)
    ) or ('%#TbLineBufOnClose#' .. close_btn)
    name = '%#TbLineBufOn#' .. name .. close_btn
  else
    close_btn = (
      vim.bo[nr].modified
      and '%'
        .. nr
        .. '@TbKillBuf@%#TbLineBufOffModified#'
        .. icon_plug('', 'pencil', 1, 1)
    ) or ('%#TbLineBufOffClose#' .. close_btn)
    name = '%#TbLineBufOff#' .. name .. close_btn
  end

  return name
end

return M

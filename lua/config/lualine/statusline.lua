local add_icon = require('utils').add_icon
local buffer_not_empty = require('utils').buffer_not_empty
local hide_in_width = require('utils').hide_in_width
local color = require('settings.colors')

local function left_separator() return '' end

local function right_separator() return '' end

local function lsp_source()
  local msg = 'No Active LSP'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then return msg end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end
  return msg
end

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local function branch_source()
  local msg = 'Not in a git repository'
  local git_branch = vim.b.gitsigns_head
  if git_branch then return git_branch end
  return msg
end

return {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {
    {
      left_separator,
      color = { fg = color.bg, bg = color.none },
      cond = buffer_not_empty,
      padding = { left = 3, right = 0 },
    },
    {
      lsp_source,
      icon = add_icon('server'),
      color = { bg = color.bg },
      cond = buffer_not_empty,
    },
    {
      function() return '|' end,
      color = { fg = 'Grey', bg = color.bg, gui = 'none' },
      cond = buffer_not_empty,
      padding = { left = 0, right = 0 },
    },
    {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      symbols = {
        error = add_icon('x-circle'),
        warn = add_icon('alert'),
        info = add_icon('info'),
        hint = ' ',
      },
      diagnostics_color = {
        color_error = { fg = color.red },
        color_warn = { fg = color.yellow },
        color_info = { fg = color.blue },
        color_hint = { fg = color.cyan },
      },
      always_visible = true,
      color = { bg = color.bg },
    },
    {
      right_separator,
      color = { fg = color.bg, bg = color.none },
      cond = buffer_not_empty,
      padding = { left = 0, right = 0 },
    },
    { function() return '%=' end },
    {
      left_separator,
      color = { fg = color.bg, bg = color.none },
      cond = hide_in_width or buffer_not_empty,
      padding = { left = 0, right = 0 },
    },
    {
      'fileformat',
      icons_enabled = true,
      cond = hide_in_width or buffer_not_empty,
      color = { bg = color.bg },
      symbols = {
        unix = 'LF',
        dos = 'CRLF',
        mac = 'CR',
      },
    },
    {
      'o:encoding',
      fmt = string.upper,
      icons_enabled = true,
      cond = hide_in_width or buffer_not_empty,
      color = { fg = color.fg, bg = color.bg },
    },
    {
      'filesize',
      cond = hide_in_width or buffer_not_empty,
      color = { bg = color.bg },
    },
    {
      right_separator,
      color = { fg = color.bg, bg = color.none },
      cond = hide_in_width or buffer_not_empty,
      padding = { left = 0, right = 0 },
    },
  },
  lualine_x = {
    {
      left_separator,
      color = { fg = color.bg, bg = color.none },
      padding = { left = 0, right = 0 },
      cond = buffer_not_empty,
    },
    {
      'diff',
      source = diff_source,
      color = { bg = color.bg },
      symbols = {
        added = add_icon('diff-added'),
        modified = add_icon('diff-modified'),
        removed = add_icon('diff-removed'),
        ignored = add_icon('diff-ignored'),
        renamed = add_icon('diff-renamed'),
      },
      diff_color = {
        added = { fg = color.green },
        modified = { fg = color.blue },
        removed = { fg = color.red },
        ignored = { fg = color.red },
        renamed = { fg = color.red },
      },
    },
    {
      branch_source,
      icon = add_icon('git-branch'),
      color = { fg = color.orange, gui = 'bold', bg = color.bg },
    },
    {
      right_separator,
      color = { fg = color.bg, bg = color.none },
      padding = { left = 0, right = 3 },
      cond = buffer_not_empty,
    },
  },
  lualine_y = {},
  lualine_z = {},
}

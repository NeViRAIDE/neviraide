local buffer_not_empty = require('utils').buffer_not_empty
local hide_in_width = require('utils').hide_in_width

local function get_file_path()
  if vim.fn.bufname('%') == '' then return '' end
  local sep = '/'
  local path_list =
    vim.split(string.gsub(vim.fn.expand('%:~:.:h'), '%%', ''), sep)
  local file_path = ''
  for _, cur in ipairs(path_list) do
    file_path = (cur == '.' or cur == '~') and ''
      or file_path
        .. cur
        .. ' %#LspSagaWinbarSep#'
        .. icon('triangle-right')
        .. '%#lualine_c_filetype_normal#'
  end
  return file_path
end

local custom_fname = require('lualine.components.filename'):extend()
local highlight = require('lualine.highlight')

function custom_fname:init(options)
  custom_fname.super.init(self, options)
  self.options.symbols.modified = ' ' .. icon('pencil')
  self.options.symbols.readonly = ' ' .. icon('lock')
  self.options.symbols.newfile = ' ' .. icon('file')
  self.options.symbols.unnamed = ' ' .. icon('question')
  self.status_colors = {
    newfile = highlight.create_component_highlight_group(
      { bg = color.none, fg = color.green, gui = 'bold' },
      'filename_status_newfile',
      self.options
    ),

    saved = highlight.create_component_highlight_group(
      { bg = color.none, fg = color.fg, gui = 'bold' },
      'filename_status_saved',
      self.options
    ),
    modified = highlight.create_component_highlight_group(
      { bg = color.none, fg = color.red, gui = 'bold,italic' },
      'filename_status_modified',
      self.options
    ),
  }
  if self.options.color == nil then self.options.color = '' end
end
function custom_fname:newfile()
  local data = custom_fname.super.update_status(self)
  data = highlight.component_format_highlight(self.status_colors.newfile)
    .. data
  return data
end
function custom_fname:update_status()
  local data = custom_fname.super.update_status(self)
  data = highlight.component_format_highlight(
    vim.bo.modified and self.status_colors.modified or self.status_colors.saved
  ) .. data
  return data
end

local function config_winbar()
  local exclude = {
    ['teminal'] = true,
    ['toggleterm'] = true,
    ['prompt'] = true,
    ['NvimTree'] = true,
    ['help'] = true,
    ['term'] = true,
    ['nvim-tree'] = true,
  }
  if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
    vim.wo.winbar = ''
  else
    local ok, lspsaga = pcall(require, 'lspsaga.symbolwinbar')
    local symbols
    if ok then symbols = lspsaga.get_symbol_node() end
    if symbols ~= nil then
      return symbols
    else
      return ' ...connect to LSP for document symbols... '
    end
  end
end

return {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {
    {
      function() return ' ' end,
      padding = { left = 2, right = 0 },
    },
    {
      get_file_path,
      cond = hide_in_width or buffer_not_empty,
      color = { bg = color.none },
      padding = { left = 0, right = 0 },
    },
    {
      'filetype',
      icon_only = true,
      cond = buffer_not_empty,
      color = { bg = color.none },
      padding = { left = 0, right = 1 },
    },
    {
      custom_fname,
      newfile_status = true,
      cond = buffer_not_empty,
      padding = { left = 1, right = 0 },
    },
    {
      config_winbar,
      padding = { left = 0, right = 0 },
      color = { bg = color.none },
      cond = buffer_not_empty,
    },
  },
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}

local function left_separator() return '' end

local function right_separator() return '' end

local function clock() return ' ' .. os.date('%H:%M') end

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
        .. '▶ '
        .. '%#lualine_c_filetype_normal#'
  end
  return file_path
end

local custom_fname = require('lualine.components.filename'):extend()
local highlight = require('lualine.highlight')

function custom_fname:init(options)
  custom_fname.super.init(self, options)
  self.options.symbols.modified = '🖊️'
  self.options.symbols.readonly = '🔏'
  self.options.symbols.newfile = ''
  self.options.symbols.unnamed = 'ﱤ'
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

local conditions = {
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 100 end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

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

local function interpreter()
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  if buf_ft == 'lua' then
    return _VERSION
  elseif buf_ft == 'go' then
    local go_version = vim.fn.execute(':!go version')
    return 'Go ' .. go_version:match('%d[^ ]*')
  elseif buf_ft == 'python' then
    local python_version =
      vim.fn.execute(':python import sys; print(sys.version)')
    return 'Python ' .. python_version:match('%d[^ ]*')
  end
  return buf_ft:gsub('^%l', string.upper)
end

local function virtual_env()
  local clients = vim.lsp.get_active_clients()
  for _, client in ipairs(clients) do
    if client.name == 'pyright' and vim.env.VIRTUAL_ENV then
      local virtual_env_path = vim.env.VIRTUAL_ENV
      return '(' .. virtual_env_path:match('.virtualenvs/(.*)') .. ')'
    end
    return ''
  end
  return ''
end

return {
  clock = clock,
  left_separator = left_separator,
  right_separator = right_separator,
  conditions = conditions,
  get_file_path = get_file_path,
  custom_fname = custom_fname,
  virtual_env = virtual_env,
  interpreter = interpreter,
  diff_source = diff_source,
  branch_source = branch_source,
  lsp_source = lsp_source,
}

---Filepath breadcrumb of your
--workspace with separators.
---@return string
local function get_file_path()
  if vim.fn.bufname('%') == '' then return '' end
  local sep = '/'
  local path_list =
    vim.split(string.gsub(vim.fn.expand('%:~:.:h'), '%%', ''), sep)
  local file_path = ''
  for _, cur in ipairs(path_list) do
    file_path = (cur == '.' or cur == '~') and ''
      or file_path
        .. '%#BreadcrumbDir#'
        .. ' '
        .. cur
        .. ' %#BreadcrumbSep#'
        .. '▶ '
        .. '%#lualine_c_normal#'
  end
  return file_path
end

---The name of the current file
--with dynamic change color and
--icon depending on state.
local custom_fname = require('lualine.components.filename'):extend()
local highlight = require('lualine.highlight')

function custom_fname:init(options)
  custom_fname.super.init(self, options)
  self.options.symbols.modified = ' '
  self.options.symbols.readonly = ' '
  self.options.symbols.newfile = ' '
  self.options.symbols.unnamed = '▣ '
  self.status_colors = {
    newfile = highlight.create_component_highlight_group(
      { fg = 'Green', gui = 'bold' },
      'filename_status_newfile',
      self.options
    ),
    saved = highlight.create_component_highlight_group(
      { gui = 'bold' },
      'filename_status_saved',
      self.options
    ),
    modified = highlight.create_component_highlight_group(
      { fg = '#e78284', gui = 'bold,italic' },
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

return {
  get_file_path = get_file_path,
  custom_fname = custom_fname,

  ---Get added, modified and
  ---removed diffs from the
  --gitsigns plugin.
  diff_source = function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed,
      }
    end
  end,

  ---Name of the current git
  --branch from the gitsigns
  --plugin or a message.
  ---@return string
  branch_source = function()
    local msg = 'Not in a GIT repository'
    local git_branch = vim.b.gitsigns_head
    if git_branch then return git_branch end
    return msg
  end,

  ---Name of the LSP server
  --for the current filetype
  --or a message.
  ---@return string
  lsp_source = function()
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
  end,

  ---Filetype with version
  --of the interpreter.
  ---@return string
  interpreter = function()
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
  end,

  conditions = {
    ---If buffer not empty.
    ---@return boolean
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,

    ---If windows width less than 100.
    ---@return boolean
    hide_in_width = function() return vim.fn.winwidth(0) > 100 end,

    ---Hide if no diffs
    ---@return boolean
    gitdiff = function()
      return vim.b.gitsigns_status ~= '' and vim.b.gitsigns_status ~= nil
    end,

    ---Hide navic triangle after filename if no location under cursor
    ---@return boolean
    is_navic_location = function()
      if next(vim.lsp.get_active_clients()) ~= nil then
        return require('nvim-navic').get_location() ~= ''
      end
    end,

    ---@return boolean
    is_navic_available = function()
      if next(vim.lsp.get_active_clients()) ~= nil then
        return require('nvim-navic').is_available()
      end
    end,
  },
}

---Current time
--(hours and minutes).
---@return string
local function clock()
  return icon('clock', '', 'Time:') .. ' ' .. os.date('%H:%M')
end

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
        .. cur
        .. ' %#LspSagaWinbarSep#'
        .. icon('triangle-right', '▶ ', '> ')
        .. '%#lualine_c_filetype_normal#'
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
  self.options.symbols.modified = icon('pencil', ' ', 'NOT SAVED')
  self.options.symbols.readonly = icon('lock', ' ', 'READ ONLY')
  self.options.symbols.newfile = icon('file', ' ', 'NEW FILE')
  self.options.symbols.unnamed = icon('ﱤ ', '▣ ', 'UNNAMED')
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
  ---If buffer not empty.
  ---@return boolean
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
  ---If windows width less than 100.
  ---@return boolean
  hide_in_width = function() return vim.fn.winwidth(0) > 100 end,

  -- TODO: add conditions for diff separator
  gitsigns = function()
    local gs_diff = vim.b.gitsigns_status_dict
    if vim.b.gitsigns_status then
      return gs_diff.added > 0 or gs_diff.removed > 0 or gs_diff.modified > 0
    end
    return false
  end,
}

---Get added, modified and
---removed diffs from the
--gitsigns plugin.
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

---Name of the current git
--branch from the gitsigns
--plugin or a message.
---@return string
local function branch_source()
  local msg = 'Not in a git repository'
  local git_branch = vim.b.gitsigns_head
  if git_branch then return git_branch end
  return msg
end

---Name of the LSP server
--for the current filetype
--or a message.
---@return string
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

---Filetype with version
--of the interpreter.
---@return string
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

---Name of the virtual environment
--for python filetype (working with
--"pyright" language server).
---@return string
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

-- TODO: make todo_count for lualine
--
-- local a = require('plenary.async_lib')
-- local async, await, run = a.async, a.await, a.run
--
-- local tcs = require('todo-comments.search')
--
-- local count = async(function()
--   tcs.search(async(function(results)
--     local res = await(#results)
--     await(print('inside:', res))
--     return res
--   end))
-- end)
--
-- print('outside simple:', count())
-- print('outside run:', run(count()))

---Number of incomplete tasks
local function todo_count()
  local res = 0
  return 'You have ' .. res .. ' todos.'
end

------------------------------------------------------------------------------------------------

---Lualine separator component with type, condition and paddings.
---If use with no parameters it return '|' separator with no conditions and 0 paddings
---Types:
---  'left' = 
---  'right' = 
---  '' or 'any_string' = |
---@param type string | nil
---@param condition any | nil
---@param left_padding integer | nil
---@param right_padding integer | nil
---@return table
local function separator(type, condition, left_padding, right_padding)
  if type == 'left' then
    return {
      function() return icon('', '', '') end,
      color = { fg = color.bg, bg = color.none },
      cond = condition,
      padding = { left = left_padding, right = right_padding },
    }
  elseif type == 'right' then
    return {
      function() return icon('', '', '') end,
      color = { fg = color.bg, bg = color.none },
      cond = condition,
      padding = { left = left_padding, right = right_padding },
    }
  end
  return {
    function() return '|' end,
    color = { fg = color.visual, bg = color.bg },
    cond = condition,
    padding = { left = left_padding, right = right_padding },
  }
end

return {
  clock = clock,
  separator = separator,
  conditions = conditions,
  get_file_path = get_file_path,
  custom_fname = custom_fname,
  virtual_env = virtual_env,
  interpreter = interpreter,
  diff_source = diff_source,
  branch_source = branch_source,
  lsp_source = lsp_source,
  todo_count = todo_count,
}

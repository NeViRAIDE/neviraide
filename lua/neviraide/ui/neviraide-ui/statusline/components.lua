local icon = require('neviraide.ui.neviraide-ui.icons.utils').icon
local utils = require('neviraide.ui.neviraide-ui.utils')
local mode_color =
  require('neviraide.ui.neviraide-ui.statusline.utils').mode_color

-- TODO: add on click event for all components
-- TODO: add run code component
-- FIX: for checkhealth filetype

---@type NeviraideStatusLine
local M = {}

---@type StatusLineSeparator
local function separator(symbol, size, condition)
  local mode = vim.api.nvim_get_mode().mode
  if condition then
    return string.rep(
      ' ',
      size,
      '%#' .. mode_color[mode][2] .. '#' .. symbol .. '%#Comment#'
    )
  end
  return ''
end

M.indent = function() return '%#Comment#%=' end

M.mode = function()
  local mode = vim.api.nvim_get_mode().mode
  local current_mode = '%#'
    .. mode_color[mode][2]
    .. '#'
    .. mode_color[mode][1]
    .. '%#Comment#'
  return separator('', 2, true) .. current_mode .. separator('', 2, true)
end

M.interpreter = function(condition)
  -- local highlight = 'St_interpreter'
  local buf_number = vim.api.nvim_get_current_buf()
  local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = buf_number })

  -- PERF: check all for better speed

  -- if buf_ft == 'lua' then
  --   return '%#' .. highlight .. '#' .. i('', 'lua', 0, 2) .. _VERSION
  -- elseif buf_ft == 'rust' then
  --   vim.defer_fn(function()
  --     local rust_version = vim.fn.execute(':!rustc -V')
  --     return '%#'
  --       .. highlight
  --       .. '#'
  --       .. i('', 'rust', 0, 2)
  --       .. 'Rust '
  --       .. rust_version:match('%d[^ ]*')
  --   end, 0)
  -- elseif buf_ft == 'go' then
  --   local go_version = vim.fn.execute(':!go version')
  --   return '%#'
  --     .. highlight
  --     .. '#'
  --     .. i('', 'go', 0, 2)
  --     .. 'Go '
  --     .. go_version:match('%d[^ ]*')
  -- elseif buf_ft == 'python' then
  --   local python_version = vim.fn.system('python -V')
  --   python_version = python_version:match('%d+%.%d+%.%d+')
  --   return '%#'
  --     .. highlight
  --     .. '#'
  --     .. i('', 'python', 0, 2)
  --     .. 'Python '
  --     .. python_version
  -- end
  -- TODO: add icons for interpreter

  if condition then
    return separator('|', 2, condition) .. utils.capitalizeFirstLetter(buf_ft)
  end
  return utils.capitalizeFirstLetter(buf_ft)
end

M.LSP_status = function()
  if rawget(vim, 'lsp') then
    for _, client in ipairs(vim.lsp.get_clients()) do
      if
        client.attached_buffers[vim.api.nvim_get_current_buf()]
        and client.name ~= 'null-ls'
      then
        local long = '%#St_LspStatus#'
          .. '%@OpenLspInfo@'
          .. icon('', 'server', 1, 2)
          .. client.name
        local short = '%#St_LspStatus#'
          .. '%@OpenLspInfo@'
          .. icon('', 'server', 1, 2)
          .. 'LSP'
        return (vim.o.columns > 100 and long) or short
      end
    end
  end
  return '%#Comment#'
end

M.LSP_Diagnostics = function()
  if not rawget(vim, 'lsp') then return '%#Comment#' end

  local errors =
    #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings =
    #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local hints =
    #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  local info =
    #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

  local err = (errors and errors > 0)
      and ('%#St_lspError#' .. icon('', 'x-circle', 0, 1) .. errors .. ' ')
    or ''
  local war = (warnings and warnings > 0)
      and ('%#St_lspWarning#' .. icon('', 'alert', 0, 1) .. warnings .. ' ')
    or ''
  local hin = (hints and hints > 0)
      and ('%#St_LspHints#' .. icon('', 'light-bulb', 0, 1) .. hints)
    or ''
  local inf = (info and info > 0)
      and ('%#St_LspInfo#' .. icon('', 'info', 0, 1) .. info .. ' ')
    or ''

  if err ~= '' or war ~= '' or inf ~= '' or hin ~= '' then
    return separator('|', 2, true)
      .. '%@OpenDiagnosticWorkspace@'
      .. err
      .. war
      .. inf
      .. hin
  else
    return ''
  end
end

M.git = function()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then return '' end

  local git_status = vim.b.gitsigns_status_dict

  local added = (git_status.added and git_status.added ~= 0)
      and (icon('', 'diff-added', 1, 1) .. git_status.added)
    or ''
  local changed = (git_status.changed and git_status.changed ~= 0)
      and (icon('', 'diff-modified', 1, 1) .. git_status.changed)
    or ''
  local removed = (git_status.removed and git_status.removed ~= 0)
      and (icon('', 'diff-removed', 1, 1) .. git_status.removed)
    or ''
  local branch_name = icon('', 'git-branch', 0, 1) .. git_status.head .. ' '

  if added ~= '' or changed ~= '' or removed ~= '' then
    return '%@OpenDiff@'
      .. '%#DiffAdded#'
      .. added
      .. '%#DiffModified#'
      .. changed
      .. '%#DiffRemoved#'
      .. removed
      .. separator('|', 2, true)
      .. '%#gitcommitBranch#'
      .. '%@OpenGitStatus@'
      .. branch_name
      .. '%#Comment#'
  else
    return '%#gitcommitBranch#' .. branch_name .. '%#Comment#'
  end
end

M.location = function()
  local lines = vim.api.nvim_buf_line_count(0)
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  if
    c <= 1
    or vim.bo.filetype == 'neviraideDashboard'
    or vim.bo.filetype == 'TelescopePrompt'
  then
    return '%#St_Location#' .. icon('Ln', 'rows', 1, 2) .. r .. '/' .. lines
  end
  return '%#St_Location#'
    .. icon('Col', 'columns', 0, 2)
    .. c
    .. ','
    .. icon('Ln', 'rows', 1, 2)
    .. r
    .. '/'
    .. lines
end

M.filesize = function(condition)
  local file = tostring(vim.fn.expand('%:p'))
  if file == nil or #file == 0 then return '' end
  local size = vim.fn.getfsize(file)
  if size <= 0 then return '' end

  local suffixes = { 'b', 'k', 'm', 'g' }

  local i = 1
  while size > 1024 and i < #suffixes do
    size = size / 1024
    i = i + 1
  end

  local format = i == 1 and '%d%s' or '%.1f%s'

  if condition then
    return separator('|', 2, condition)
      .. '%#St_filesize#'
      .. string.format(format, size, suffixes[i])
  end
  return ''
end

M.fileformat = function(condition)
  local symbols = {
    unix = 'LF ',
    dos = 'CRLF ',
    mac = 'CR ',
  }
  if condition then
    return separator('|', 2, condition)
      .. '%#St_fileformat#'
      .. symbols[vim.bo.fileformat]
  end
  return ''
end

M.encoding = function(condition)
  local buf_enc = vim.opt.fileencoding._value
  if condition and buf_enc ~= '' then
    return separator('|', 2, condition)
      .. '%#St_encoding#'
      .. string.upper(buf_enc)
  end
  return ''
end

M.spaces = function(condition)
  if condition then return '%#St_spaces#' .. vim.o.tabstop .. ' spaces' end
  return ''
end

M.lazy = function()
  local ok, lazy = pcall(require, 'lazy.status')
  if ok then
    local count = lazy.updates()
    if count ~= false then
      for _, client in ipairs(vim.lsp.get_clients()) do
        if
          client.attached_buffers[vim.api.nvim_get_current_buf()]
          and client.name ~= 'null-ls'
        then
          return separator('|', 2, true)
            .. '%#Boolean#'
            .. '%@UpdatePlugins@'
            .. count
        end
      end
      return ' %#Boolean#' .. '%@UpdatePlugins@' .. count
    end
  end
  return ''
end

return M

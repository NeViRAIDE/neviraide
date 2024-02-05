local M = {}

local neviraide_themes_path =
  vim.fn.fnamemodify(debug.getinfo(1, 'S').source:sub(2), ':p:h')

M.get_theme_tb = function(type)
  local default_dir = 'neviraide.ui.neviraide-ui.themes.colorschemes.'
  local default_path = default_dir .. NEVIRAIDE().theme

  local ok, default_theme = pcall(require, default_path)

  if ok then
    return default_theme[type]
  else
    error('No such theme!')
  end
end

M.merge_tb = function(...) return vim.tbl_deep_extend('force', ...) end

M.extend_default_hl = function(highlights)
  local polish_hl = M.get_theme_tb('polish_hl')

  -- polish themes
  if polish_hl then
    for key, value in pairs(polish_hl) do
      if highlights[key] then
        highlights[key] = M.merge_tb(highlights[key], value)
      end
    end
  end

  -- transparency
  if vim.g.transparency then
    local transparent = require('neviraide.ui.neviraide-ui.themes.transparent')

    for key, value in pairs(transparent) do
      if highlights[key] then
        highlights[key] = M.merge_tb(highlights[key], value)
      end
    end
  end
end

---@return table
M.load_highlight = function(group)
  group = require('neviraide.ui.neviraide-ui.themes.integrations.' .. group)
  M.extend_default_hl(group)
  return group
end

-- convert table into string
M.table_to_str = function(tb)
  local result = ''

  for hlgroupName, hlgroup_vals in pairs(tb) do
    local hlname = "'" .. hlgroupName .. "',"
    local opts = ''

    for optName, optVal in pairs(hlgroup_vals) do
      local valueInStr = (
        (type(optVal)) == 'boolean' or type(optVal) == 'number'
      )
          and tostring(optVal)
        or '"' .. optVal .. '"'
      opts = opts .. optName .. '=' .. valueInStr .. ','
    end

    result = result .. 'vim.api.nvim_set_hl(0,' .. hlname .. '{' .. opts .. '})'
  end

  return result
end

M.saveStr_to_cache = function(filename, tb)
  local bg_opt = "vim.opt.bg='" .. M.get_theme_tb('type') .. "'"
  local defaults_cond = filename == 'defaults' and bg_opt or ''

  local lines = 'return string.dump(function()'
    .. defaults_cond
    .. M.table_to_str(tb)
    .. 'end, true)'
  local file = io.open(vim.g.ntc .. filename, 'wb')

  if file then
    file:write(loadstring(lines)())
    file:close()
  end
end

M.compile = function()
  if not vim.uv.fs_stat(vim.g.ntc) then vim.fn.mkdir(vim.g.ntc, 'p') end

  -- All integration modules, each file returns a table
  local hl_files = neviraide_themes_path .. '/integrations'

  for _, file in ipairs(vim.fn.readdir(hl_files)) do
    -- skip caching some files
    if file ~= 'statusline' or file ~= 'treesitter' then
      local filename = vim.fn.fnamemodify(file, ':r')
      M.saveStr_to_cache(filename, M.load_highlight(filename))
    end
  end
end

M.load_all_highlights = function()
  require('plenary.reload').reload_module('neviraide.ui.neviraide-ui.themes')
  M.compile()

  for _, file in ipairs(vim.fn.readdir(vim.g.ntc)) do
    dofile(vim.g.ntc .. file)
  end
end

return M

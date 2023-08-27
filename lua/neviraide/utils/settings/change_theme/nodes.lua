local NuiTree = require('nui.tree')

local list_themes = function()
  local default_themes = vim.fn.readdir(
    '~/Study/nvim_plugins/neviraide-ui.nvim/lua/neviraide-ui/themes/colorschemes'
  )
  -- local default_themes = vim.fn.readdir(vim.fn.stdpath('data') .. '/lazy/base46/lua/base46/themes')

  -- local custom_themes =
  --   vim.loop.fs_stat(fn.stdpath('config') .. '/lua/custom/themes')

  -- if custom_themes and custom_themes.type == 'directory' then
  --   local themes_tb = fn.readdir(fn.stdpath('config') .. '/lua/custom/themes')
  --   for _, value in ipairs(themes_tb) do
  --     default_themes[#default_themes + 1] = value
  --   end
  -- end

  for index, theme in ipairs(default_themes) do
    default_themes[index] = theme:match('(.+)%..+')
  end

  return default_themes
end

return function()
  return {
    NuiTree.Node({ text = 'Everforest' }, {
      NuiTree.Node({ text = 'Dark', name = 'everforest' }),
      NuiTree.Node({ text = 'Light', name = 'everforest_light' }),
    }),
    NuiTree.Node({ text = 'Nord', name = 'nord' }),
    NuiTree.Node({ text = 'Onedark', name = 'onedark' }),
    NuiTree.Node({ text = 'TokyoNight', name = 'tokyonight' }),
  }
end
-- return list_themes()

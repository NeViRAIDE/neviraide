local NuiTree = require('nui.tree')

---@param theme table
---@return table
local function theme_node(theme)
  local to_main_node = {}

  for _, p in pairs(theme.colors) do
    local test_color_node = NuiTree.Node({
      text = p.name .. ' ('  .. p.bg .. ')',
      theme = p.cmd,
      background = p.bg,
      pallete = p.pallete,
    })
    table.insert(to_main_node, test_color_node)
  end

  return to_main_node
end

local function main_node()
  local themes = require('neviraide.utils.settings.change_theme.themes')
  local to_tree = {}

  for _, theme in pairs(themes) do
    local colors = theme_node(theme)
    local test_main_node = NuiTree.Node({ text = theme.name }, colors)
    table.insert(to_tree, test_main_node)
  end

  return to_tree
end

return function() return main_node() end

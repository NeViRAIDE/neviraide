local NuiTree = require('nui.tree')
local dir = require('neviraide.ui.neviraide-ui.utils').dirLookup

local themes = {}

for _, theme in pairs(dir()) do
  table.insert(
    themes,
    NuiTree.Node({
      text = theme
        :gsub('./', '')
        :gsub('^%l', string.upper)
        :gsub('_light', ' (light)'),
      name = theme,
    })
  )
end

return themes

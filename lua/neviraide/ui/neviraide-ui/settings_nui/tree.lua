return function()
  local Tree = require('nui.tree')
  local NuiLine = require('nui.line')
  local nodes = require('neviraide.ui.neviraide-ui.settings_nui.menu')
  local popups = require('neviraide.ui.neviraide-ui.settings_nui.popups')

  return Tree({
    bufnr = popups.tree.bufnr,
    nodes = nodes,
    prepare_node = function(node)
      local line = NuiLine()
      line:append(string.rep('  ', node:get_depth() - 1))
      if node:has_children() then
        line:append(node:is_expanded() and ' ' or ' ', 'SpecialChar')
      else
        line:append('  ')
      end
      line:append(node.text)
      return line
    end,
  })
end

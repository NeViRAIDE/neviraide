return function(popup)
  local NuiTree = require('nui.tree')
  local NuiLine = require('nui.line')

  return NuiTree({
    winid = popup.winid,
    nodes = require('neviraide.utils.settings.change_theme.nodes')(),
    prepare_node = function(node)
      local line = NuiLine()
      line:append(string.rep('  ', node:get_depth() - 1))
      if node:has_children() then
        line:append(node:is_expanded() and ' ' or ' ', 'SpecialChar')
        line:append(node.text, 'SpecialChar')
      else
        line:append('  ')
        line:append(node.text)
      end
      return line
    end,
  }, {
    bufhidden = 'hide',
    buflisted = false,
    buftype = 'nofile',
    swapfile = false,
  })
end

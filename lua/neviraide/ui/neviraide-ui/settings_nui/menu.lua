local Tree = require('nui.tree')
local utils = require('neviraide.ui.neviraide-ui.settings_nui.utils')
local config = require('NEVIRAIDE')

local menu = {
  utils.formatCategoryTitle('UI'),
  utils.formatMenuItem('theme', config.theme),
  utils.formatMenuItem('transparency', config.transparency),
  utils.formatMenuItem('numbers', config.numbers_enabled),
  utils.formatMenuItem('relative_numbers', config.relative_numbers),
  utils.formatMenuItem('cursor_line', config.cursor_line),
  utils.formatMenuItem('cursor_column', config.cursor_column),
  utils.formatMenuItem('indents', config.indents),
  utils.formatMenuItem('borders', config.border),
  utils.formatMenuItem('nonicons', config.nonicons),
  utils.formatCategoryTitle('GIT'),
  utils.formatMenuItem('gitsigns_line', config.gitsigns_current_line_blame),
  utils.formatMenuItem('gitsigns_signs', config.gitsigns_signs),
  utils.formatCategoryTitle('LSP'),
  utils.formatMenuItem('lsp_inlay_hints', config.lsp_inlay_hints),
  utils.formatMenuItem(
    'diagnostic_virtual_text',
    config.diagnostic_virtual_text
  ),
  utils.formatMenuItem('diagnostic_signs', config.diagnostic_signs),
  utils.formatMenuItem('font_family', config.font_family),
  utils.formatMenuItem('font_size', config.font_size),
}

local nodes = {}
for _, item in ipairs(menu) do
  table.insert(nodes, Tree.Node({ text = item }))
end

table.insert(
  nodes,
  Tree.Node({ text = 'test1' }, {
    Tree.Node({ text = 'test2' }),
  })
)

return nodes

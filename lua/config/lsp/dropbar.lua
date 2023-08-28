local icon = require('neviraide-ui.icons.utils').icon

return {
  sources = {
    path = {
      modified = function(sym)
        return sym:merge({
          name = sym.name .. '  ',
          icon = icon('pencil') .. '  ',
          name_hl = 'DiagnosticError',
          icon_hl = 'DiagnosticError',
        })
      end,
    },
  },
  icons = {
    kinds = {
      use_devicons = true,
      symbol = require('neviraide-ui.icons.lspkind'),
    },
    ui = {
      bar = {
        separator = ' ' .. icon('chevron-right') .. ' ',
        extends = '…',
      },
    },
  },
}

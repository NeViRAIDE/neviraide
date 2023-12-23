return function()
  local icon = require('neviraide-ui.icons.utils').icon

  return {
    sources = {
      path = {
        modified = function(sym)
          return sym:merge({
            -- TODO: add nonicons
            name = sym.name .. '  ',
            icon = icon('', 'pencil', 0, 2),
            name_hl = 'DiagnosticError',
            icon_hl = 'DiagnosticError',
          })
        end,
      },
    },
    icons = {
      kinds = {
        use_devicons = true,
        symbol = require('neviraide.utils').icons().lspkind,
      },
      ui = {
        bar = {
          separator = icon('', 'chevron-right', 1, 1),
          extends = '…',
        },
      },
    },
  }
end

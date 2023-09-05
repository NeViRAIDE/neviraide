local icon = require('neviraide-ui.icons.utils').icon

local function virt_text()
  if NEVIRAIDE().diagnostic_virtual_text then
    return {
      source = 'if_many',
      spacing = 4,
      prefix = icon('●', 'dot-fill'),
    }
  else
    return false
  end
end

return {
  inlay_hints = {
    enabled = NEVIRAIDE().lsp_inlay_hints,
  },
  signature = {
    bind = false,
    floating_window = false,
    hint_enable = true,
    use_lspsaga = false,
    hint_prefix = icon('', 'eye', 0, 2),
    hint_scheme = 'Comment',
    hi_parameter = 'LspSignatureActiveParameter',
    max_height = 1,
  },
  diagnostic = {
    float = {
      border = vim.g.borders,
      source = 'if_many',
    },
    signs = NEVIRAIDE().diagnostic_signs,
    underline = true,
    update_in_insert = false,
    virtual_text = virt_text(),
    severity_sort = true,
  },
}

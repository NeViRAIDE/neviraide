local function virt_text()
  if NEVIRAIDE().lsp.diagnostic.virtual_text then
    return {
      source = 'if_many',
      spacing = 4,
      prefix = '●',
    }
  else
    return false
  end
end

return {
  inlay_hints = {
    enabled = NEVIRAIDE().lsp.inlay_hints,
  },
  signature = {
    bind = false,
    floating_window = false,
    hint_enable = true,
    use_lspsaga = false,
    hint_prefix = '  ',
    hint_scheme = 'Comment',
    hi_parameter = 'LspSignatureActiveParameter',
    max_height = 1,
  },
  diagnostic = {
    float = {
      border = require('neviraide.utils').border(),
      source = 'if_many',
    },
    signs = NEVIRAIDE().lsp.diagnostic.diagnostic_signs,
    underline = true,
    update_in_insert = false,
    virtual_text = virt_text(),
    severity_sort = true,
  },
}

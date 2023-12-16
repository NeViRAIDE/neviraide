local icon = require('neviraide-ui.icons.utils').icon
local conf = NEVIRAIDE()

---@return table|boolean
local function virt_text()
  if conf.lsp.diagnostic.virtual_text then
    return {
      source = 'if_many',
      spacing = 4,
      prefix = icon('●', 'dot-fill', 0, 1),
    }
  else
    return false
  end
end

return {
  inlay_hints = {
    enabled = conf.lsp.inlay_hints,
  },
  diagnostic = {
    float = {
      border = vim.g.borders,
      source = 'if_many',
    },
    signs = conf.lsp.diagnostic.signs,
    underline = true,
    update_in_insert = false,
    virtual_text = virt_text(),
    severity_sort = true,
  },
}

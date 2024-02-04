local i = require('neviraide-ui.icons.utils').icon
local N = NEVIRAIDE()

---@return vim.diagnostic.Opts.VirtualText|false
local function virt_text()
  if N.lsp.diagnostic.virtual_text then
    ---@type vim.diagnostic.Opts.VirtualText
    return {
      source = 'if_many',
      spacing = 4,
      prefix = i('●', 'dot-fill', 0, 1),
      virt_text_pos = 'eol',
    }
  end
  return false
end

local signs = {
  Error = i('', 'x-circle', 0, 1),
  Warn = i('', 'alert', 0, 1),
  Hint = i('', 'light-bulb', 0, 1),
  Info = i('', 'info', 0, 1),
}

local function config()
  vim.diagnostic.config({
    float = {
      border = vim.g.borders,
      source = 'if_many',
    },
    signs = N.lsp.diagnostic.signs,
    underline = true,
    update_in_insert = false,
    virtual_text = virt_text(),
    severity_sort = true,
  })
end

local M = {}

function M.setup()
  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
  config()
end

return M

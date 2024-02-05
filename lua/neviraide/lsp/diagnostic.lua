local i = require('neviraide-ui.icons.utils').icon
local g = vim.g

---@return vim.diagnostic.Opts.VirtualText|false
local function virt_text()
  if g.d_virt_text then
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

local function config()
  vim.diagnostic.config({
    float = {
      border = g.b,
      source = 'if_many',
    },
    signs = g.l_d_s,
    underline = true,
    update_in_insert = false,
    virtual_text = virt_text(),
    severity_sort = true,
  })
end

local signs = {
  Error = i('', 'x-circle', 0, 1),
  Warn = i('', 'alert', 0, 1),
  Hint = i('', 'light-bulb', 0, 1),
  Info = i('', 'info', 0, 1),
}

---Setting up diagnostic configuration.
--- - signs highlights and icons
--- - virtual text
--- - severity sort
--- - update in insert mode or not
--- - floating diagnostic window
--- - underline or not
return function()
  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
  config()
end

local M = {}

function M.setup()
  local opts = require('neviraide.lsp.options')

  local signs = {
    Error = ' ',
    Warn = ' ',
    Hint = ' ',
    Info = ' ',
  }
  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.diagnostic.config(opts.diagnostic)
end

-- TODO: try to realize by nui

return M

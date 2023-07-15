local M = {}

function M.setup()
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.diagnostic.config({
    signs = false,
    underline = true,
    update_in_insert = false,
    virtual_text = false,
    severity_sort = true,
  })

  vim.lsp.handlers["workspace/diagnostic/refresh"] = function(_, _, ctx)
    local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
    pcall(vim.diagnostic.reset, ns)
    return true
  end
end

return M

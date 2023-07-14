local on_attach = require("config.lsp.on_attach")
local capabilities = require("config.lsp.capabilites")

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

return {
  "neovim/nvim-lspconfig",
  -- init = function()
  --   require("utils").lazy_load "nvim-lspconfig"
  -- end,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("lspconfig").lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = { debounce_text_changes = 150 },
      single_file_support = true,
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          diagnostics = { globals = { 'vim' } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
          format = { enable = true },
          hint = { enable = true },
        },
      },
    }
  end,
}

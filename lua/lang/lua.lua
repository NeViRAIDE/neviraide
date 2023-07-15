require("lspconfig").sumneko_lua.setup {
  on_attach = require("plugins.config.lsp.on_attach"),
  capabilities = require("plugins.config.lsp.capabilities"),
  flags = { debounce_text_changes = 150 },
  single_file_support = true,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- workspace = {
      --   library = {
      --     [vim.fn.expand('$VIMRUNTIME/lua')] = true,
      --     [vim.fn.stdpath('config') .. '/lua'] = true,
      --   },
      -- },
      telemetry = { enable = false },
      format = { enable = true },
      hint = { enable = true },
    },
  },
}

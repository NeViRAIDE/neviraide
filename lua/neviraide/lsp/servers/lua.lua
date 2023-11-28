return {
  capabilities = require('neviraide.lsp.capabilities'),
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
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
      format = { enable = false },
      semantic = { keyword = true },
      hint = {
        enable = true,
        setType = true,
      },
      codeLens = { enable = true },
      completion = { callSnippet = 'Enable' },
    },
  },
}

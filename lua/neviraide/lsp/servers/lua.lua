return {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
      hint = {
        enable = true,
        setType = true,
      },
      semantic = { enable = true },
      completion = {
        callSnippet = 'Replace',
        displayContext = 5,
      },
    },
  },
}

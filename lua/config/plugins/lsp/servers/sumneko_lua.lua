require('lspconfig').sumneko_lua.setup({
  on_attach = require('config.plugins.lsp.on_attach').build(),
  capabilities = require('config.plugins.lsp.capabilities').build(),
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
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true,
        },
      },
      telemetry = { enable = false },
      format = { enable = false },
      hint = { enable = true }
    },
  },
})

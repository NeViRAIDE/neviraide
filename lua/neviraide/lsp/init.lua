vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    local mason_registry = require('mason-registry')
    local capabilities = require('neviraide.lsp.capabilities')

    local servers = {
      lua_ls = {
        package = 'lua-language-server',
        config = require('neviraide.lsp.servers.lua'),
        filetypes = { 'lua' },
        root_markers = { '.luarc.json', '.git' }
      },
      vtsls = {
        package = 'vtsls',
        config = require('neviraide.lsp.servers.vtsls'),
        filetypes = { 'javascriptreact', 'typescriptreact', 'javascript', 'typescript' },
        root_markers = { 'tsconfig.json', 'package.json', '.git' },
        cmd = { vim.fn.stdpath('data') .. '/mason/bin/vtsls', '--stdio' }
      },
      html = {
        package = 'html-lsp',
        config = require('neviraide.lsp.servers.html').init_options,
        filetypes = { 'html', '.git' },
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/vscode-html-language-server", "--stdio" }
      },
    }

    for name, entry in pairs(servers) do
      local pkg = mason_registry.get_package(entry.package)
      if not pkg:is_installed() then pkg:install() end

      vim.lsp.config[name] = vim.tbl_deep_extend('force', {
        capabilities = capabilities,
        filetypes = entry.filetypes,
        single_file_support = true,
        cmd = entry.cmd or { entry.package },
        -- root_dir = require('neviraide.utils').root_pattern(entry.root_markers or { '.git' }),
      }, entry.config or {})

      vim.lsp.enable(name)
    end

    require('neviraide.lsp.autocommands')
  end,
})

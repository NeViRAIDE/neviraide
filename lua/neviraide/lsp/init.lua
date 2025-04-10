vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    local mason_registry = require('mason-registry')
    local capabilities = require('neviraide.lsp.capabilities')

    local servers = {
      lua_ls = {
        package = 'lua-language-server',
        config = require('neviraide.lsp.servers.lua').settings,
        filetypes = { 'lua' },
        root_markers = { '.luarc.json' }
      },
      vtsls = {
        package = 'vtsls',
        config = require('neviraide.lsp.servers.vtsls').settings,
        filetypes = { 'javascript', 'typescript' },
      },
      html = {
        package = 'html-lsp',
        config = require('neviraide.lsp.servers.html').init_options,
        filetypes = { 'html' },
      },
    }

    for name, entry in pairs(servers) do
      local pkg = mason_registry.get_package(entry.package)
      if not pkg:is_installed() then pkg:install() end

      vim.lsp.config[name] = vim.tbl_deep_extend('force', {
        capabilities = capabilities,
        filetypes = entry.filetypes,
        single_file_support = true,
        cmd = { entry.package },
      }, entry.config or {})

      vim.lsp.enable(name)
    end

    require('neviraide.lsp.autocommands')
  end,
})

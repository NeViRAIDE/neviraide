dofile(vim.g.neviraide_themes_cache .. 'lsp')

---server returns lsp servers configuration.
---@param filetype string
---@return function
local function server(filetype)
  return require('neviraide.lsp.servers.' .. filetype)
end

return function()
  require('neviraide.lsp.diagnostic')
  require('lspconfig.ui.windows').default_options.border = vim.g.borders

  local lspconfig = require('lspconfig')
  local mason_lsp_config = require('mason-lspconfig')

  mason_lsp_config.setup({
    ensure_installed = {
      'lua_ls',
    },
    automatic_installation = true,
  })

  mason_lsp_config.setup_handlers({
    function(server_name)
      if server_name ~= 'rust_analyzer' then
        lspconfig[server_name].setup({
          capabilities = require('neviraide.lsp.capabilities'),
          single_file_support = true,
        })
      end
    end,
    ['lua_ls'] = function(_) lspconfig.lua_ls.setup(server('lua')) end,
    ['tsserver'] = function(_) lspconfig.tsserver.setup(server('ts_js')) end,
    -- ['gopls'] = function(_) lspconfig.gopls.setup(server('go')) end,
    -- ['rust_analyzer'] = function(_) lspconfig.rust_analyzer.setup(server('rs')) end,
    -- ['volar'] = function(_) lspconfig.volar.setup(server('vue')) end,
    -- ['html'] = function(_) lspconfig.html.setup(server('html')) end,
    -- ['emmet_language_server'] = function(_)
    -- lspconfig.emmet_language_server.setup(server('emmet'))
    -- end,
  })
end

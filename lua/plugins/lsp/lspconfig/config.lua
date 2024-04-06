dofile(vim.g.ntc .. 'lsp')

---server returns lsp servers configuration.
---@param filetype string
---@return function
local function server(filetype)
  return require('neviraide.lsp.servers.' .. filetype)
end

return function()
  local lspconfig = require('lspconfig')
  local mason_lsp_config = require('mason-lspconfig')

  require('neviraide.lsp.autocommands')
  -- LspInfo borders
  require('lspconfig.ui.windows').default_options.border = vim.g.b

  -- vim.lsp.handlers['textDocument/hover'] =
  --   vim.lsp.with(vim.lsp.handlers.hover, {
  --     border = vim.g.b,
  --   })

  vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
      -- Use a sharp border with `FloatBorder` highlights
      border = vim.g.b,
    })

  vim.lsp.handlers['textDocument/hover'] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      -- Use a sharp border with `FloatBorder` highlights
      border = vim.g.b,
      -- add the title in hover float window
      -- title = ' hover ',
    })

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
  })
end

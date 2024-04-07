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

  -- vim.lsp.handlers['textDocument/signatureHelp'] =
  --   vim.lsp.with(vim.lsp.handlers.signature_help, {
  --     -- Use a sharp border with `FloatBorder` highlights
  --     border = vim.g.b,
  --   })

  -- vim.lsp.handlers['textDocument/hover'] = function(err, result, ctx, config)
  --   if err or not result then return end
  --   local bufnr, winnr = vim.lsp.util.open_floating_preview(
  --     vim.lsp.util.convert_input_to_markdown_lines(result.contents),
  --     'markdown',
  --     {
  --       border = vim.g.b, -- Или указать тип границы напрямую, например, "rounded"
  --       max_width = 70, --Устанавливаем максимальную ширину окна
  --     }
  --   )
  --
  --   -- Включение переноса текста для созданного буфера
  --   local current_win = vim.api.nvim_get_current_win()
  --   vim.api.nvim_set_option_value('wrap', true, { win = current_win })
  -- end

  vim.lsp.handlers['textDocument/hover'] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = vim.g.b,
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

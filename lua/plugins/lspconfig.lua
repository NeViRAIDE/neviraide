local autocmd_multi = require("utils").autocmd_multi

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


local signature_config = {
  bind = false,
  floating_window = false,
  hint_enable = true,
  use_lspsaga = false,
  hint_prefix = '  ',
  hint_scheme = 'LspSignatureActiveParameterHint',
  hi_parameter = 'LspSignatureActiveParameter',
  max_height = 1,
}

local function on_attach(client, bufnr)
  require('lsp_signature').on_attach(signature_config, bufnr)

  require('mappings.lsp').attach_lsp(bufnr)
  require('mappings.diagnostic').attach_diagnostic(bufnr)
  -- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
  if client.server_capabilities.documentHighlightProvider then
    autocmd_multi('lsp_document_highlight', {
      {
        'CursorHold',
        {
          pattern = '*',
          desc = "Visual highlighting sybmol's references in document when cursor hold on it",
          command = 'lua vim.lsp.buf.document_highlight()',
        },
      },
      {
        'CursorMoved',
        {
          pattern = '*',
          desc = "Reset visual highlighting sybmol's references in document when cursor moved",
          command = 'lua vim.lsp.buf.clear_references()',
        },
      },
    })
  end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}


return {
  "neovim/nvim-lspconfig",
  -- init = function() require("utils").lazy_load "nvim-lspconfig" end,
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },
  config = function()
    require("lspconfig").gopls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      flags = { debounce_text_changes = 150 },
      single_file_support = true,
      settings = {
        gopls = {
          experimentalPostfixCompletions = true,
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
          usePlaceholders = false,
          codelenses = {
            references = true,
            genrate = true,
            gc_details = true,
          },
        },
      },
    })

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

  dependencies = {
    'ray-x/lsp_signature.nvim' },
}

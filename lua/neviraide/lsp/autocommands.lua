---@type NeviraideUtils
local util = require('neviraide.utils')

util.autocmd('NEVIRAIDE_lsp_features', 'LspAttach', {
  callback = function(args)
    ---The buffer where the lsp attached
    ---@type number
    local buffer = args.buf

    ---Language server
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client then
      if client.server_capabilities.semanticTokensProvider then
        dofile(vim.g.ntc .. 'semantic_tokens')
      end

      if NEVIRAIDE().lsp.inlay_hints then
        -- enable inlay hints
        if client.supports_method('textDocument/inlayHint') then
          vim.lsp.inlay_hint.enable()
        end
      end

      -- enable document symbol highlighting
      if client.server_capabilities.documentHighlightProvider then
        util.autocmd_multi('lsp_document_highlight', {
          {
            { 'CursorHold', 'CursorHoldI' },
            {
              buffer = buffer,
              desc = "Visual highlighting sybmol's references in document when cursor hold on it",
              callback = function() vim.lsp.buf.document_highlight() end,
            },
          },
          {
            'CursorMoved',
            {
              buffer = buffer,
              desc = "Reset visual highlighting sybmol's references in document when cursor moved",
              callback = function() vim.lsp.buf.clear_references() end,
            },
          },
        })
      end

      if vim.g.l_cl and vim.lsp.codelens then
        -- enable codelenses
        if client.supports_method('textDocument/codeLens') then
          vim.lsp.codelens.refresh()
          util.autocmd(
            'NEVIRAIDE_codelens',
            { 'BufEnter', 'InsertLeave', 'BufWritePre' },
            {
              buffer = buffer,
              callback = vim.lsp.codelens.refresh,
            }
          )
        end
      end
    end

    if vim.g.l_fbs then
      -- enable auto format file before save
      if client then
        if client.server_capabilities.documentFormattingProvider then
          util.autocmd('NEVIRAIDE_auto_format', 'BufWritePre', {
            buffer = buffer,
            callback = function()
              if client and client.name ~= 'null-ls' then
                vim.lsp.buf.format()
              end
            end,
          })
        end
      end
    end
  end,
})

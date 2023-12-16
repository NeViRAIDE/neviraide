local utils = require('neviraide.utils')

utils.autocmd('NEVIRAIDE_lsp_features', 'LspAttach', {
  callback = function(args)
    -- the buffer where the lsp attached
    ---@type number
    local buffer = args.buf

    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client ~= nil then
      utils.mappings('lsp')(buffer)

      require('neviraide.lsp.diagnostic').setup()
      utils.mappings('diagnostic')(buffer)

      -- enable inlay hints
      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(args.buf, true)
      end

      -- enable document symbol highlighting
      if client.server_capabilities.documentHighlightProvider then
        utils.autocmd_multi('lsp_document_highlight', {
          {
            'CursorHold',
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

      -- enable codelenses
      if client.server_capabilities.codeLensProvider then
        utils.autocmd('NEVIRAIDE_codelens', { 'BufEnter', 'InsertLeave' }, {
          buffer = buffer,
          callback = function() vim.lsp.codelens.refresh() end,
        })
      end
    end

    -- enable auto format file before save
    utils.autocmd('NEVIRAIDE_auto_format', 'BufWritePre', {
      buffer = buffer,
      callback = function() vim.lsp.buf.format() end,
    })

    -- enable auto show diagnostics
    utils.autocmd('NEVIRAIDE_auto_diag', 'CursorHold', {
      buffer = buffer,
      callback = function()
        vim.diagnostic.open_float(nil, {
          focusable = false,
          close_events = {
            'BufLeave',
            'CursorMoved',
            'InsertEnter',
            'FocusLost',
          },
          border = vim.g.borders,
          source = 'if_many',
          prefix = ' ',
          scope = 'cursor',
        })
      end,
    })
  end,
})

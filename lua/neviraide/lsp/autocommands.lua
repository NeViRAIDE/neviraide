local utils = require('neviraide.utils')
local diagnostic = require('neviraide.lsp.diagnostic')
local diagnostic_mappings = require('plugins.which-key.mappings.diagnostic')
local g = vim.g
local vl = vim.lsp
local vlb = vim.lsp.buf

---@param on_attach fun(client, buffer)
local function on_attach(on_attach)
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local buffer = args.buf ---@type number
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

utils.autocmd('NEVIRAIDE_lsp_features', 'LspAttach', {
  callback = function(args)
    -- the buffer where the lsp attached
    ---@type number
    local buffer = args.buf

    local client = vl.get_client_by_id(args.data.client_id)

    dofile(vim.g.ntc .. 'semantic_tokens')

    if client then
      -- utils.mappings('lsp')(buffer)

      diagnostic()
      diagnostic_mappings(client, buffer)

      -- print('inspect client:', vim.inspect(client))
      -- print('provider: ', vim.inspect(client.server_capabilities))
      -- print('is enabled: ', vim.lsp.inlay_hint.is_enabled(buffer))

      if g.l_ih then
        -- enable inlay hints
        if client.server_capabilities.inlayHintProvider then
          utils.autocmd(
            'NEVIRAIDE_inlay_hints',
            { 'BufEnter', 'InsertLeave', 'BufReadPost' },
            {
              buffer = buffer,
              callback = function() vim.lsp.inlay_hint.enable(buffer, true) end,
            }
          )
        end
      end

      -- enable document symbol highlighting
      if client.server_capabilities.documentHighlightProvider then
        utils.autocmd_multi('lsp_document_highlight', {
          {
            'CursorHold',
            {
              buffer = buffer,
              desc = "Visual highlighting sybmol's references in document when cursor hold on it",
              callback = function() vlb.document_highlight() end,
            },
          },
          {
            'CursorMoved',
            {
              buffer = buffer,
              desc = "Reset visual highlighting sybmol's references in document when cursor moved",
              callback = function() vlb.clear_references() end,
            },
          },
        })
      end

      -- if client.server_capabilities.colorProvider then
      --   -- Attach document colour support
      --   require('document-color').buf_attach(bufnr)
      -- end

      if g.l_cl then
        -- enable codelenses
        if client.server_capabilities.codeLensProvider then
          utils.autocmd(
            'NEVIRAIDE_codelens',
            { 'BufEnter', 'BufReadPost', 'InsertLeave' },
            {
              buffer = buffer,
              callback = function() vl.codelens.refresh() end,
            }
          )
        end
      end
    end

    if g.l_fbs then
      -- enable auto format file before save
      if client.server_capabilities.documentFormattingProvider then
        utils.autocmd('NEVIRAIDE_auto_format', 'BufWritePre', {
          buffer = buffer,
          callback = function() vlb.format() end,
        })
      end
    end

    if g.l_d_soh then
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
            border = g.b,
            source = 'if_many',
            prefix = ' ',
            scope = 'cursor',
          })
        end,
      })
    end
  end,
})

---@type NeviraideUtils
local util = require('neviraide.utils')
local diagnostic = require('neviraide.lsp.diagnostic')
local diagnostic_mappings = require('plugins.which-key.mappings.diagnostic')

local function hints(buf, value)
  local ih = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
  if type(ih) == 'function' then
    ih(buf, value)
  elseif type(ih) == 'table' and ih.enable then
    if value == nil then value = not ih.is_enabled(buf) end
    ih.enable(buf, value)
  end
end

util.autocmd('NEVIRAIDE_lsp_features', 'LspAttach', {
  callback = function(args)
    -- the buffer where the lsp attached
    ---@type number
    local buffer = args.buf

    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- FIX: add for semantic tokens if available
    dofile(vim.g.ntc .. 'semantic_tokens')

    if client then
      diagnostic()
      diagnostic_mappings(client, buffer)

      if NEVIRAIDE().lsp.inlay_hints then
        -- enable inlay hints
        if client.supports_method('textDocument/inlayHint') then
          hints(buffer, true)
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
            { 'BufEnter', 'CursorHold', 'InsertLeave' },
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
            callback = function() vim.lsp.buf.format() end,
          })
        end
      end
    end

    if vim.g.l_d_soh then
      -- enable auto show diagnostics
      util.autocmd('NEVIRAIDE_auto_diag', 'CursorHold', {
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
            border = vim.g.b,
            source = 'if_many',
            prefix = ' ',
            scope = 'cursor',
          })
        end,
      })
    end
  end,
})

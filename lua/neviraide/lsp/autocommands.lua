---@type NeviraideUtils
local util = require('neviraide.utils')

util.autocmd('NEVIRAIDE_lsp_features', 'LspAttach', {
  callback = function(ev)
    local buffer = ev.buf
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    if not client then return end

    -- Semantic tokens
    if client.server_capabilities.semanticTokensProvider then
      dofile(vim.g.ntc .. 'semantic_tokens')
    end

    -- Enable autocompletion if supported (use 'buffer' variable, not ev)
    if client:supports_method('textDocument/completion') then
      vim.bo[buffer].omnifunc = 'v:lua.vim.lsp.omnifunc'
      -- local chars = {}
      -- for i = 32, 126 do table.insert(chars, string.char(i)) end
      -- client.server_capabilities.completionProvider = client.server_capabilities.completionProvider or {}
      -- client.server_capabilities.completionProvider.triggerCharacters = chars

      vim.lsp.completion.enable(true, client.id, buffer, {
        autotrigger = true,
        convert = function(item)
          return { addr = item.label }
        end
      })

      vim.api.nvim_create_autocmd('InsertCharPre', {
        buffer = buffer,
        callback = function()
          -- vim.defer_fn(function()
          vim.schedule(function()
            vim.lsp.completion.get()
          end)
        end
      })
    end

    -- vim.api.nvim_set_keymap(
    --   'i',
    --   '<Tab>',
    --   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],
    --   { noremap = true, expr = true, silent = true }
    -- )

    -- TODO: make this good
    vim.keymap.set('i', '<Tab>', function()
      return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
    end, { noremap = true, expr = true, silent = true })

    vim.api.nvim_set_keymap(
      'i',
      '<S-Tab>',
      [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]],
      { noremap = true, expr = true, silent = true }
    )

    -- Inlay hints
    if
        NEVIRAIDE().lsp.inlay_hints
        and client:supports_method('textDocument/inlayHint')
    then
      vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
    end

    -- Document highlights
    if client.server_capabilities.documentHighlightProvider then
      util.autocmd_multi('lsp_document_highlight', {
        {
          { 'CursorHold', 'CursorHoldI' },
          {
            buffer = buffer,
            callback = function() vim.lsp.buf.document_highlight() end,
          },
        },
        {
          'CursorMoved',
          {
            buffer = buffer,
            callback = function() vim.lsp.buf.clear_references() end,
          },
        },
      })
    end

    -- Code lenses
    if vim.g.l_cl and client:supports_method('textDocument/codeLens') then
      vim.lsp.codelens.refresh({ bufnr = buffer })
      util.autocmd(
        'NEVIRAIDE_codelens',
        { 'BufEnter', 'InsertLeave', 'BufWritePre' },
        {
          buffer = buffer,
          callback = function() vim.lsp.codelens.refresh({ bufnr = buffer }) end,
        }
      )
    end

    -- Auto format before save
    if
        vim.g.l_fbs and client.server_capabilities.documentFormattingProvider
    then
      util.autocmd('NEVIRAIDE_auto_format', 'BufWritePre', {
        buffer = buffer,
        callback = function()
          if client.name ~= 'null-ls' then
            vim.lsp.buf.format({ bufnr = buffer })
          end
        end,
      })
    end
  end,
})

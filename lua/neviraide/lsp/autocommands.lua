--------------------------------------------------------------------------------
-- Patch LSP completion handler to remove invalid textEdit fields
--
-- This patch ensures that if a CompletionItem comes with a textEdit field but
-- its 'range' is nil or incomplete, it is cleared. This prevents Neovim from
-- attempting to index a nil 'range' and crashing.
--------------------------------------------------------------------------------
local original_completion_handler = vim.lsp.handlers["textDocument/completion"]
vim.lsp.handlers["textDocument/completion"] = function(err, result, ctx, config)
  if result and result.items then
    for _, item in ipairs(result.items) do
      if item.textEdit and (not item.textEdit.range or not item.textEdit.range.start) then
        item.textEdit = nil
      end
    end
  end
  return original_completion_handler(err, result, ctx, config)
end

--------------------------------------------------------------------------------
-- LspAttach autocommand to setup LSP features and autocompletion
--------------------------------------------------------------------------------
---@type NeviraideUtils
local util = require("neviraide.utils")

util.autocmd("NEVIRAIDE_lsp_features", "LspAttach", {
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then return end

    --------------------------------------------------------------------------
    -- Semantic tokens
    --------------------------------------------------------------------------
    if client.server_capabilities.semanticTokensProvider then
      -- Execute external semantic_tokens configuration
      dofile(vim.g.ntc .. "semantic_tokens")
    end

    --------------------------------------------------------------------------
    -- Autocompletion setup
    --------------------------------------------------------------------------
    if client.server_capabilities.completionProvider then
      -- Set omnifunc to the built-in LSP omnifunction
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- Enable built-in LSP completion (asynchronous, can be autotriggered)
      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = false })

      --------------------------------------------------------------------------
      -- Navigation in completion menu: Tab and Shift-Tab
      --------------------------------------------------------------------------
      vim.keymap.set("i", "<Tab>", function()
        return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
      end, { noremap = true, expr = true, silent = true, buffer = bufnr })

      vim.keymap.set("i", "<S-Tab>", function()
        return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
      end, { noremap = true, expr = true, silent = true, buffer = bufnr })

      vim.keymap.set("i", "<CR>", function()
        if vim.fn.pumvisible() == 1 then
          return "<C-y>"
        else
          return "<CR>"
        end
      end, { noremap = true, expr = true, silent = true, buffer = bufnr })


      if NEVIRAIDE().lsp.completion.auto then
        vim.api.nvim_create_autocmd("InsertCharPre", {
          buffer = bufnr,
          callback = function()
            vim.schedule(function()
              pcall(vim.lsp.completion.get)
            end)
          end,
        })
      end
    end

    --------------------------------------------------------------------------
    -- Inlay hints (if enabled in your Neviraide configuration)
    --------------------------------------------------------------------------
    if NEVIRAIDE().lsp.inlay_hints and client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    --------------------------------------------------------------------------
    -- Document highlights: highlight symbol under cursor
    --------------------------------------------------------------------------
    if client.server_capabilities.documentHighlightProvider then
      util.autocmd_multi("lsp_document_highlight", {
        {
          { "CursorHold", "CursorHoldI" },
          {
            buffer = bufnr,
            callback = function() vim.lsp.buf.document_highlight() end,
          },
        },
        {
          "CursorMoved",
          {
            buffer = bufnr,
            callback = function() vim.lsp.buf.clear_references() end,
          },
        },
      })
    end

    --------------------------------------------------------------------------
    -- Code lenses: refresh periodically
    --------------------------------------------------------------------------
    if vim.g.l_cl and client:supports_method("textDocument/codeLens") then
      vim.lsp.codelens.refresh({ bufnr = bufnr })
      util.autocmd("NEVIRAIDE_codelens", { "BufEnter", "InsertLeave", "BufWritePre" }, {
        buffer = bufnr,
        callback = function() vim.lsp.codelens.refresh({ bufnr = bufnr }) end,
      })
    end

    --------------------------------------------------------------------------
    -- Auto format on save
    --------------------------------------------------------------------------
    if vim.g.l_fbs and client.server_capabilities.documentFormattingProvider then
      util.autocmd("NEVIRAIDE_auto_format", "BufWritePre", {
        buffer = bufnr,
        callback = function()
          if client.name ~= "null-ls" then
            vim.lsp.buf.format({ bufnr = bufnr })
          end
        end,
      })
    end
  end,
})

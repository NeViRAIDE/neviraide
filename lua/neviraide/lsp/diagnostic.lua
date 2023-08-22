local M = {}

function M.setup()
  local opts = require('neviraide.lsp.options')

  local signs = {
    Error = ' ',
    Warn = ' ',
    Hint = ' ',
    Info = ' ',
  }
  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.diagnostic.config(opts.diagnostic)
end

-- TODO: try to realize by nui

-- local Popup = require('nui.popup')
-- local event = require('nui.utils.autocmd').event

-- function M.diagnostic_popup(text)
--   local popup = Popup({
--     enter = true,
--     focusable = true,
--     border = {
--       style = 'rounded',
--     },
--     position = '50%',
--     size = {
--       width = '80%',
--       height = '60%',
--     },
--   })
--
--   -- mount/open the component
--   popup:mount()
--
--   -- unmount component when cursor leaves buffer
--   popup:on(event.BufLeave, function() popup:unmount() end)
--   -- set content
--   vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, text)
-- end

return M

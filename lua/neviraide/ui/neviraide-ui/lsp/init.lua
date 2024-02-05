local require = require('neviraide.ui.neviraide-ui.utils.lazy')

local M = {}

---@alias LspEvent "lsp"
M.event = 'lsp'

---@enum LspKind
M.kinds = {
  progress = 'progress',
  hover = 'hover',
  message = 'message',
  signature = 'signature',
}

function M.setup()
  require('neviraide.ui.neviraide-ui.lsp.hover').setup()
  require('neviraide.ui.neviraide-ui.lsp.signature').setup()
  require('neviraide.ui.neviraide-ui.lsp.message').setup()
  require('neviraide.ui.neviraide-ui.override_vim_ui.lsp').setup()
end

function M.scroll(delta)
  return require('neviraide.ui.neviraide-ui.lsp.docs').scroll(delta)
end

function M.hover()
  ---@diagnostic disable-next-line: missing-parameter
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(
    0,
    'textDocument/hover',
    params,
    require('neviraide.ui.neviraide-ui.lsp.hover').on_hover
  )
end

function M.signature()
  ---@diagnostic disable-next-line: missing-parameter
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(
    0,
    'textDocument/signatureHelp',
    params,
    require('neviraide.ui.neviraide-ui.lsp.signature').on_signature
  )
end

return M

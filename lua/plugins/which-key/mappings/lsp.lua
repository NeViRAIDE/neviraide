local icon = require('neviraide-ui.icons.utils').icon

local function show_documentation()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ 'vim', 'help' }, filetype) then
    vim.cmd('h ' .. vim.fn.expand('<cword>'))
  elseif vim.tbl_contains({ 'man' }, filetype) then
    vim.cmd('Man ' .. vim.fn.expand('<cword>'))
  elseif
    vim.fn.expand('%:t') == 'Cargo.toml' and require('crates').popup_available()
  then
    require('crates').show_popup()
  else
    vim.lsp.buf.hover()
  end
end

return {
  name = 'LSP' .. icon('', 'server', 1),
  a = { ':lua vim.lsp.buf.code_action()<cr>', 'Code action' },
  c = { ':lua vim.lsp.codelens.run()<cr>', 'Codelens action' },
  d = { ':Telescope lsp_definitions<cr>', 'Definition' },
  D = { ':lua vim.lsp.buf.declaration()<cr>', 'Declaration' },
  f = { ':lua vim.lsp.buf.format()<cr>', 'Format file' },
  h = { show_documentation, 'Hover' },
  r = { ':Telescope lsp_references<cr>', 'References' },
  R = { ':lua vim.lsp.buf.rename()<cr>', 'Rename' },
  s = { ':lua vim.lsp.buf.signature_help()<cr>', 'Signature help' },
  t = { ':Telescope lsp_type_definitions<cr>', 'Type definition' },
  S = {
    name = 'Server' .. icon('', 'server', 1),
    r = { ':LspRestart<cr>', 'Restart server' },
    i = { ':LspInfo<cr>', 'Server information' },
    l = { ':LspLog<cr>', 'Server logs' },
    s = { ':LspStart<cr>', 'Start server' },
    S = { ':LspStop<cr>', 'Stopserver' },
  },
}

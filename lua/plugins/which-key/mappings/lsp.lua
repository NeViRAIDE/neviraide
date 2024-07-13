local icon = require('stigmata.utils').icon

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
  { '<leader>l', group = 'LSP', icon = icon('', 'server') },
  {
    '<leader>la',
    '<cmd>lua vim.lsp.buf.code_action()<cr>',
    desc = 'Code action',
  },
  {
    '<leader>lc',
    '<cmd>lua vim.lsp.codelens.run()<cr>',
    desc = 'Codelens action',
  },
  { '<leader>ld', '<cmd>Telescope lsp_definitions<cr>', desc = 'Definition' },
  {
    '<leader>lD',
    '<cmd>lua vim.lsp.buf.declaration()<cr>',
    desc = 'Declaration',
  },
  {
    '<leader>lf',
    '<cmd>lua vim.lsp.buf.format()<cr>',
    desc = 'Format file',
  },
  { '<leader>lh', show_documentation, desc = 'Hover' },
  {
    '<leader>lr',
    '<cmd>Telescope lsp_references<cr>',
    desc = 'References',
  },
  {
    '<leader>lR',
    '<cmd>lua vim.lsp.buf.rename()<cr>',
    desc = 'Rename',
  },
  {
    '<leader>ls',
    '<cmd>lua vim.lsp.buf.signature_help()<cr>',
    desc = 'Signature help',
  },
  {
    '<leader>lt',
    '<cmd>Telescope lsp_type_definitions<cr>',
    desc = 'Type definition',
  },
  {
    { '<leader>lS', group = 'Server' .. icon('', 'server') },
    { '<leader>lSr', '<cmd>LspRestart<cr>', desc = 'Restart server' },
    { '<leader>lSi', '<cmd>LspInfo<cr>', desc = 'Server information' },
    { '<leader>lSl', '<cmd>LspLog<cr>', desc = 'Server logs' },
    { '<leader>lSs', '<cmd>LspStart<cr>', desc = 'Start server' },
    { '<leader>lSS', '<cmd>LspStop<cr>', desc = 'Stopserver' },
  },
}

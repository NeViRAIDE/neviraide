local filetypes_list = {
  'help',
  'TelescopePrompt',
  'neviraideDashboard',
  'lazy',
  'mason',
  'lspinfo',
  'neviraide-ui',
  'neviraide_ui',
  'nui',
  'colorschemes',
  'create',
  'renameTab',
  'nuiInput',
  'nui_sm',
  'nofile',
  'neo-tree',
  'neo-tree-popup',
  'terminal',
  'notify',
  'neotest-output',
  'neotest-summary',
  'nekifoch',
  'input',
  'indents',
  'timer',
}

local function is_ignored_file_type()
  for _, filetype in ipairs(filetypes_list) do
    if vim.bo.filetype == filetype then return true end
  end
  return false
end

return {
  ignored = is_ignored_file_type,
}

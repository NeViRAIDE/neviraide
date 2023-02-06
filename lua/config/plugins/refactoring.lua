-- TODO: check
local M = {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-treesitter/nvim-treesitter' },
  },
}

function M.config()
  require('refactoring').setup({
    prompt_func_return_type = {
      go = true,
    },
    prompt_func_param_type = {
      go = true,
    },
    printf_statements = {},
    print_var_statements = {},
    extract_var_statements = {
      go = '%s := %s // poggers',
    },
  })
end

return M

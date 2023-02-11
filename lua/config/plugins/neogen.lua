local M = {
  'danymat/neogen',
  event = 'BufReadPre',
  dependencies = 'nvim-treesitter/nvim-treesitter',
}

function M.config()
  require('neogen').setup({
    snippet_engine = 'luasnip',
  })
end

return M

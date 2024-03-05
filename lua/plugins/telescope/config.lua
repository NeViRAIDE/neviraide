return function(_, opts)
  dofile(vim.g.ntc .. 'telescope')
  local telescope = require('telescope')
  telescope.setup(opts)
  for _, ext in ipairs(opts.extensions_list) do
    telescope.load_extension(ext)
  end
end

return function(_, opts)
  -- dofile(vim.g.neviraide_themes_cache .. 'blankline')
  vim.g.rainbow_delimiters = { highlight = opts.highlight }

  local hooks = require('ibl.hooks')
  hooks.register(
    hooks.type.WHITESPACE,
    hooks.builtin.hide_first_space_indent_level
  )
  require('ibl').setup(opts)
end

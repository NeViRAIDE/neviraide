local highlight = {
  'RainbowDelimiterRed',
  'RainbowDelimiterOrange',
  'RainbowDelimiterYellow',
  'RainbowDelimiterGreen',
  'RainbowDelimiterCyan',
  'RainbowDelimiterBlue',
  'RainbowDelimiterViolet',
}

return function()
  dofile(vim.g.ntc .. 'ibl_rd')

  local hooks = require('ibl.hooks')

  vim.g.rainbow_delimiters = { highlight = highlight }

  require('ibl').setup({ scope = { highlight = highlight } })

  hooks.register(
    hooks.type.SCOPE_HIGHLIGHT,
    hooks.builtin.scope_highlight_from_extmark
  )
end

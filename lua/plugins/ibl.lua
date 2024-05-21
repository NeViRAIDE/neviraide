return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    local highlight = {
      'RainbowDelimiterRed',
      'RainbowDelimiterOrange',
      'RainbowDelimiterYellow',
      'RainbowDelimiterGreen',
      'RainbowDelimiterCyan',
      'RainbowDelimiterBlue',
      'RainbowDelimiterViolet',
    }
    dofile(vim.g.ntc .. 'ibl_rd')

    local hooks = require('ibl.hooks')

    vim.g.rainbow_delimiters = { highlight = highlight }

    require('ibl').setup({ scope = { highlight = highlight } })

    hooks.register(
      hooks.type.SCOPE_HIGHLIGHT,
      hooks.builtin.scope_highlight_from_extmark
    )

    require('ibl').update()
  end,
}

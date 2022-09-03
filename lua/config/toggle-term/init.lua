require('toggleterm').setup({
  size = function(term)
    if term.direction == 'horizontal' then
      return 10
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  highlights = {
    Normal = {
      guibg = '#202328',
    },
    NormalFloat = {
      guibg = '#202328',
    },
    FloatBorder = {
      guifg = '#ec5f67',
    },
  },
  direction = 'horizontal',
})

require('config.toggle-term.lazygit')
require('config.toggle-term.ipython')

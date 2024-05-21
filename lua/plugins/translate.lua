return {
  'uga-rosa/translate.nvim',
  cmd = 'Translate',
  opts = {
    silent = true,
    defalut = {
      command = 'google',
      output = 'floating',
    },
    preset = {
      output = {
        floating = {
          relative = 'cursor',
          style = 'minimal',
          width = nil,
          height = nil,
          row = 1,
          col = 1,
          border = vim.g.b,
          filetype = 'translate',
          zindex = 50,
        },
        split = {
          position = 'bottom',
          min_size = 5,
          max_size = 0.5,
          name = 'translate://translation',
          filetype = 'translate',
          append = true,
        },
        parse_after = {
          window = {
            width = 0.99,
          },
        },
      },
    },
  },
}

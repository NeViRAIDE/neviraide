return {
  'akinsho/toggleterm.nvim',
  version = '*',
  cmd = "ToggleTerm",
  opts = {
    size = function(term)
      if term.direction == 'horizontal' then
        return vim.o.lines * 0.4
      elseif term.direction == 'vertical' then
        return vim.o.columns * 0.4
      end
    end,
    winbar = {
      enabled = true,
    },
    float_opts = {
      border = 'rounded',
      width = function(term) return math.floor(vim.o.columns * 0.6) end,
      height = function(term) return math.floor(vim.o.lines * 0.5) end,
    },
  }
}

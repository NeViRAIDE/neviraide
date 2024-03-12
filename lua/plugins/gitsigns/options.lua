dofile(vim.g.ntc .. 'git')

return {
  signcolumn = vim.g.g_gs,
  signs = {
    add = { text = '│' },
    change = { text = '│' },
    delete = { text = '│' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '│' },
  },
  preview_config = { border = vim.g.b },
  current_line_blame = vim.g.g_eclb,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
}

dofile(vim.g.neviraide_themes_cache .. 'git')

return {
  signcolumn = NEVIRAIDE().gitsigns_signs,
  -- TODO: add nonicons
  signs = {
    add = { text = '│' },
    change = { text = '│' },
    delete = { text = '󰍵' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '│' },
  },
  preview_config = { border = vim.g.borders },
  current_line_blame = NEVIRAIDE().gitsigns_current_line_blame,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
}

local utils = require('utils.lualine_utils')

local diff = {
  'diff',
  source = utils.diff_source,
  color = { bg = color.bg },
  symbols = {
    added = icon('diff-added'),
    modified = icon('diff-modified'),
    removed = icon('diff-removed'),
  },
  diff_color = {
    added = { fg = color.green },
    modified = { fg = color.blue },
    removed = { fg = color.red },
    ignored = { fg = color.red },
    renamed = { fg = color.red },
  },
  on_click = function() vim.fn.execute('Gitsigns diffthis') end,
}

local git_branch = {
  utils.branch_source,
  icon = icon('git-branch'),
  color = { fg = color.orange, gui = 'bold', bg = color.bg },
  on_click = function() lazygit_toggle() end,
}

return {
  utils.separator('left'),
  diff,
  -- FIX: hide if no diff
  utils.separator(),
  git_branch,
  utils.separator('right', nil, 0, 3),
}

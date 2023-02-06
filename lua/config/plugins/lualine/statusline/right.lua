local utils = require('utils.lualine_utils')

local diff = {
  'diff',
  source = utils.diff_source,
  color = { bg = color.bg },
  symbols = {
    added = icon('diff-added', ' ', 'Added '),
    modified = icon('diff-modified', ' ', 'Modified '),
    removed = icon('diff-removed', ' ', 'Removed '),
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
  icon = icon('git-branch', '', 'Branch:'),
  color = { fg = color.orange, gui = 'bold', bg = color.bg },
  on_click = function() lazygit_toggle() end,
}

return {
  utils.separator('left'),
  diff,
  utils.separator('', utils.conditions.gitdiff),
  git_branch,
  utils.separator('right', nil, 0, 3),
}

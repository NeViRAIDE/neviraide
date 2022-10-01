require('nvim-tree').setup({
  disable_netrw = true,
  view = {
    adaptive_size = true,
    preserve_window_proportions = true,
  },
  renderer = {
    add_trailing = true,
    highlight_git = true,
    highlight_opened_files = 'all',
    root_folder_modifier = ':t:r',
    indent_markers = {
      enable = true,
    },
    icons = {
      git_placement = 'after',
      symlink_arrow = icon('arrow-right'),
      glyphs = {
        default = icon('file'),
        symlink = icon('file-symlink-file'),
        bookmark = icon('bookmark'),
        folder = {
          arrow_closed = icon('triangle-right'),
          arrow_open = icon('triangle-down'),
          default = '📁',
          open = '📂',
          empty = icon('file-directory'),
          empty_open = '🪹',
          symlink = icon('file-submodule'),
          symlink_open = icon('file-submodule'),
        },
        git = {
          unstaged = icon('x'),
          staged = icon('check'),
          unmerged = icon('git-merge'),
          renamed = icon('diff-renamed'),
          untracked = icon('star'),
          deleted = icon('diff-removed'),
          ignored = icon('diff-ignored'),
        },
      },
    },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = icon('light-bulb'),
      info = icon('info'),
      warning = icon('alert'),
      error = icon('x-circle'),
    },
  },
  filters = {
    dotfiles = true,
  },
  git = {
    show_on_dirs = false,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  live_filter = {
    prefix = icon('filter') .. ' ',
    always_show_folders = false,
  },
})

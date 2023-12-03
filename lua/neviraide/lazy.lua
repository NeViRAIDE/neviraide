vim.g.mapleader = ' '

require('lazy').setup({
  { import = 'neviraide.ui' },
  { import = 'plugins' },
}, {
  defaults = {
    lazy = true,
    version = '*',
  },
  ui = { border = vim.g.borders },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        '2html_plugin',
        'tohtml',
        'getscript',
        'getscriptPlugin',
        'gzip',
        'logipat',
        'netrw',
        'netrwPlugin',
        'netrwSettings',
        'netrwFileHandlers',
        'matchit',
        'tar',
        'tarPlugin',
        'rrhelper',
        'spellfile_plugin',
        'vimball',
        'vimballPlugin',
        'zip',
        'zipPlugin',
        'tutor',
        'rplugin',
        'syntax',
        'synmenu',
        'optwin',
        'compiler',
        'bugreport',
        'ftplugin',
        'editorconfig',
      },
    },
  },
})

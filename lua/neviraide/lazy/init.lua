vim.g.mapleader = ' '

local imports = {
  { import = 'neviraide.lazy.deps' },
  { import = 'neviraide.lazy.ui' },
  { import = 'plugins' },
  { import = 'languages.rust' },
  { import = 'languages.golang' },
}

require('lazy').setup(imports, {
  defaults = { lazy = true, version = require('neviraide.utils').latest() },
  dev = { path = '~/GitHub/nvim_plugins' },
  ui = { border = vim.g.b },
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
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})

require('neviraide.ui')

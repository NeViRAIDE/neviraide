vim.g.mapleader = ' '

-- TODO: separte neviraide ui

local imports = {
  { import = 'neviraide.lazy.dependencies' },
  { import = 'neviraide.lazy.neviraide' },
  { import = 'neviraide.lazy.ui' },
  { import = 'neviraide.lazy.editor' },
  { import = 'neviraide.lazy.utils' },
  { import = 'neviraide.lazy.treesitter' },
  { import = 'neviraide.lazy.lsp' },
  { import = 'neviraide.lazy.git' },
  { import = 'neviraide.lazy.debug' },
  { import = 'languages.rust' },
  { import = 'languages.golang' },
}

require('lazy').setup(imports, {
  defaults = {
    lazy = true,
    version = require('neviraide.utils').latest(),
  },
  dev = {
    path = '~/neviraide',
    fallback = true,
  },
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

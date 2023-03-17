local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

vim.g.mapleader = ' '

require('utils')
require('settings.colors')

require('lazy').setup('config.plugins', {
  defaults = { lazy = true },
  checker = { enabled = true },
  install = { colorscheme = { 'darcula-solid', 'onedark', 'onelight' } },
  ui = { border = 'rounded' },
  performance = {
    rtp = {
      disabled_plugins = {
        '2html_plugin',
        'tohtml',
        'bugreport',
        'compiler',
        'ftplugin',
        'getscript',
        'getscriptPlugin',
        'gzip',
        'logipat',
        'matchit',
        'netrw',
        'netrwPlugin',
        'netrwSettings',
        'netrwFileHandlers',
        'optwin',
        'rrhelper',
        'rplugin',
        'spellfile_plugin',
        'syntax',
        'synmenu',
        'tar',
        'tarPlugin',
        'tutor',
        'vimball',
        'vimballPlugin',
        'zip',
        'zipPlugin',
      },
    },
  },
})

require('settings')

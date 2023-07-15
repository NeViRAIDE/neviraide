local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("core.settings")

require("lazy").setup("plugins", {
  defaults = {
    lazy = true,
    version = "*"
  },
  -- install = { colorscheme = { "tokyonight", "catppuccin" } },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
        "editorconfig",
      },
    },
  },
})

require("tokyonight").load()
vim.cmd.colorscheme "catppuccin-frappe" -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

require('core.override_vim_ui.input')
require('core.override_vim_ui.select')

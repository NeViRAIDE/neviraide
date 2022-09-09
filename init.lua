_G.__luacache_config = {
  chunks = {
    enable = true,
    path = vim.fn.stdpath('cache') .. '/luacache_chunks',
  },
  modpaths = {
    enable = true,
    path = vim.fn.stdpath('cache') .. '/luacache_modpaths',
  },
}

_G.load_config = function()
  require('settings')
  require('config')
  require('lsp')
end

_G.if_require = function(module, block, errblock)
  local ok, mod = pcall(require, module)
  if ok then
    return block(mod)
  elseif errblock then
    return errblock(mod)
  else
    vim.api.nvim_err_writeln('Failed to load ' .. module .. ': ' .. mod)
    return nil
  end
end

do
  local install_path = vim.fn.stdpath('data')
    .. '/site/pack/packer/start/packer.nvim'
  if vim.fn.isdirectory(install_path) == 0 then
    vim.fn.system({
      'git',
      'clone',
      'https://github.com/wbthomason/packer.nvim',
      install_path,
    })
    vim.cmd('packadd packer.nvim')
    require('plugins')
    require('packer').sync()
    vim.cmd('autocmd User PackerComplete ++once lua load_config()')
  else
    require('plugins')
    load_config()
  end
end

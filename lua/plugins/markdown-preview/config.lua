return function()
  vim.cmd([[
        function OpenMarkdownPreview (url)
          execute "silent ! firefox --new-window " . a:url
        endfunction
      ]])
  vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
  vim.g.mkdp_filetypes = { 'markdown' }
end

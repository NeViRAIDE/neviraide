vim.cmd('function! OpenLspInfo(a,b,c,d) \n LspInfo \n endfunction')
vim.cmd('function! OpenDiagnosticWorkspace(a,b,c,d) \n Telescope diagnostics severity_bound=ERROR \n endfunction')

vim.cmd('function! OpenGitStatus(a,b,c,d) \n Neotree position=right git_status toggle \n endfunction')
vim.cmd('function! OpenDiff(a,b,c,d) \n Gitsigns diffthis \n endfunction')

vim.cmd('function! UpdatePlugins(a,b,c,d) \n Lazy update \n endfunction')


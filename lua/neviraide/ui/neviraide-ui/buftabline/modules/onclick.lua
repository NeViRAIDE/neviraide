-- TODO: rewrite to LUA

-- buffers
vim.cmd(
  "function! TbGoToBuf(bufnr,b,c,d) \n execute 'b'..a:bufnr \n endfunction"
)
vim.cmd([[
   function! TbKillBuf(bufnr,b,c,d) 
        call luaeval('require("neviraide.ui.neviraide-ui.buftabline").close_buffer(_A)', a:bufnr)
  endfunction]])
vim.cmd(
  "function! TbTabClose(a,b,c,d) \n lua require('neviraide.ui.neviraide-ui.buftabline').closeAllBufs('closeTab') \n endfunction"
)
vim.cmd(
  "function! TbCloseAllBufs(a,b,c,d) \n lua require('neviraide.ui.neviraide-ui.buftabline').closeAllBufs() \n endfunction"
)

-- tabs
vim.cmd('function! TbNewTab(a,b,c,d) \n tabnew \n endfunction')
vim.cmd(
  "function! TbGotoTab(tabnr,b,c,d) \n execute a:tabnr ..'tabnext' \n endfunction"
)
vim.cmd(
  'function! TbToggleTabs(a,b,c,d) \n let g:TbTabsToggled = !g:TbTabsToggled | redrawtabline \n endfunction'
)

--date and time
vim.cmd([[
  function! ToggleDatetime(a,b,c,d) 
    let g:TbDatetimeToggled = !g:TbDatetimeToggled 
    redrawtabline
  endfunction
]])

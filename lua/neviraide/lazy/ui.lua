vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    require('neviraide.ui.neviraide-ui').setup(
      require('neviraide.ui.neviraide-ui.config').options
    )

    vim.defer_fn(function()
      local bufs = vim.api.nvim_list_bufs()

      if #vim.fn.argv() == 0 and (#bufs == 1 and bufs[1] == 1) then
        require('neviraide.ui.neviraide-ui.dashboard').open()
        vim.api.nvim_exec2(':bd#', { output = true })
      end
    end, 0)

    require('neviraide.ui.neviraide-ui.override_vim_ui.input')
    require('neviraide.ui.neviraide-ui.override_vim_ui.select')

    require('neviraide.ui.autocommands_ui')

    require('neviraide.ui.neviraide-ui.themes').load_all_highlights()
  end,
})

vim.api.nvim_create_autocmd('BufRead', {
  callback = function()
    require('neviraide.ui.neviraide-ui.buftabline.lazyload')

    require('neviraide.ui.neviraide-ui.override_vim_ui.input')
    require('neviraide.ui.neviraide-ui.override_vim_ui.select')
  end,
})

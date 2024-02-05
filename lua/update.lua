local M = {}

M.check_for_updates = function()
  local config_path = '~/.config/nvim'

  local fetch_cmd = 'cd ' .. config_path .. ' && git fetch'
  os.execute(fetch_cmd)

  local handle = io.popen('cd ' .. config_path .. ' && git status -uno')
  local result = handle:read('*a')
  handle:close()

  if not string.find(result, 'Your branch is up to date') then
    vim.notify(
      'NEVIRAIDE updates detected. Run `git pull` in ~/.config/nvim for updating.'
    )
  else
    vim.notify('Neviraide is up to date')
  end
end

return M

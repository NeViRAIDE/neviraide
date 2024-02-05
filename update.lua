local function check_for_updates()
  local config_path = '~/.config/nvim'

  local fetch_cmd = 'cd ' .. config_path .. ' && git fetch'
  os.execute(fetch_cmd)

  local handle = io.popen('cd ' .. config_path .. ' && git status -uno')
  local result = handle:read('*a')
  handle:close()

  if not string.find(result, 'Your branch is up to date') then
    print(
      'NEVIRAIDE updates detected. Run `git pull` in ~/.config/nvim for updating.'
    )
  else
    print('Neviraide is up to date')
  end
end

check_for_updates()

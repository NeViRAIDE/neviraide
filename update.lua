local function check_for_updates()
  print('Check NEVIRAIDE for updates...')
  local config_path = '~/.config/nvim'

  local fetch_cmd = 'cd ' .. config_path .. ' && git fetch'
  os.execute(fetch_cmd)

  local handle = io.popen('cd ' .. config_path .. ' && git status -uno')
  if handle then
    local result = handle:read('*a')
    handle:close()

    if not string.find(result, 'Your branch is up to date') then
      print('Updates available. Do you want to upgrade now? [y/n]')
      local answer = io.read()
      if answer == 'y' then
        local pull_cmd = 'cd ' .. config_path .. ' && git pull'
        print('Updating...')
        os.execute(pull_cmd)
        print('Successfull!')
      else
        print('Canceled')
      end
    else
      print('NEVIRAIDE already is up to date')
    end
  end
end

check_for_updates()

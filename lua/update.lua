local function check_for_updates()
  -- Замените путь на актуальный путь к вашему конфигурационному репозиторию Neovim
  local config_path = '~/.config/nvim'

  -- Выполнение git fetch для получения последних изменений без их применения
  local fetch_cmd = 'cd ' .. config_path .. ' && git fetch'
  os.execute(fetch_cmd)

  -- Проверка наличия обновлений, сравнивая локальную ветку с удаленной
  local handle = io.popen('cd ' .. config_path .. ' && git status -uno')
  local result = handle:read('*a')
  handle:close()

  -- Если есть обновления, выводим уведомление
  if not string.find(result, 'Your branch is up to date') then
    print(
      'Обнаружены обновления для конфигурации Neovim. Выполните git pull в ~/.config/nvim для обновления.'
    )
  end
end

return check_for_updates

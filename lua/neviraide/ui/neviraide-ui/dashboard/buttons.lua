---@type DashButtonCreator
local function btn(title, icon, nonicon, command)
  return {
    title,
    require('neviraide.ui.neviraide-ui.icons.utils').icon(icon, nonicon),
    command,
  }
end

---@type DashboardButton
local new_file = btn(
  'Create new file',
  '',
  'file',
  'lua require("neviraide.ui.neviraide-ui.utils.new_file")()'
)

---@type DashboardButton DashboardButtons
local find_files = btn('Find file', '', 'search', 'Telescope find_files')
---@type DashboardButton
local recent_files = btn('Recent files', '', 'sync', 'Telescope oldfiles')
---@type DashboardButton
local find_word = btn('Find word', '', 'codescan', 'Telescope live_grep')
---@type DashboardButton
local todo_list = btn(
  'TODO list',
  '',
  'tasklist',
  'TodoTelescope theme=ivy initial_mode=normal previewer=false layout_config={bottom_pane={height=14}}'
)
---@type DashboardButton
local check_health = btn('Check health', '', 'pulse', 'checkhealth')
---@type DashboardButton
local plugin_manager = btn('Plugin manager', '', 'plug', 'Lazy')
---@type DashboardButton
local configuration =
  btn('Configuration', '', 'gear', 'e ~/.config/nvim/lua/NEVIRAIDE.lua')
---@type DashboardButton
local exit = btn('Exit', '', 'sign-out', 'qa')

---@type DashboardButtons
return {
  new_file,
  find_files,
  recent_files,
  find_word,
  todo_list,
  check_health,
  plugin_manager,
  configuration,
  exit,
}

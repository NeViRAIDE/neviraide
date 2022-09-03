-- TODO: customize dashboard
-- TODO: create logo NEVIRAIDE
local db = require('dashboard')
db.preview_file_height = 12
db.preview_file_width = 80
db.custom_center = {
    { desc = 'Keybindings', action = 'WhichKey <leader>' },
    { desc = 'Update plugins', action = 'PackerUpdate' },
}

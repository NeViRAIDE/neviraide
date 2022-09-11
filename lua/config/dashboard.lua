local db = require('dashboard')

db.preview_file_height = 12
db.preview_file_width = 80
db.session_directory = '~/.cache/nvim/'
db.custom_header = {
  '',
  '01001110 01100101 01101111 01110110 01101001 01101101',
  '01001001 01101110 01110100 01100101 01100111 01110010 01100001 01110100 01100101 01100100',
  '01000100 01100101 01110110 01100101 01101100 01101111 01110000 01101101 01100101 01101110 01110100',
  '01000101 01101110 01110110 01101001 01110010 01101111 01101110 01101101 01100101 01101110 01110100',
  '01100010 01111001',
  '01010010 01000001 01110000 01110010 01101111 01100111 01110010 01100001 01101101 01101101',
  '',
  '. . . NEVIRAID . . .',
  '',
}
db.custom_center = {
  { desc = 'New file', action = 'DashboardNewFile' },
  { desc = 'Open last session', action = 'SessionLoad' },
  { desc = 'Keybindings', action = 'WhichKey <leader>' },
  { desc = 'Update plugins', action = 'PackerUpdate' },
  { desc = 'Exit', action = 'q' },
}

-- local plugins_count = vim.fn.len(
--   vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1)
-- )
--
-- vim.cmd([[
--   function! GetNVimVersion()
--     redir => s
--     silent! version
--     redir END
--     return matchstr(s, 'NVIM v\zs[^\n]*')
--   endfunction
-- ]])

-- local function nvim_version()
--   local string = print(vim.api.nvim_command('redir => s | version | redir END'))
-- end
-- local first_string = print(string.match(nvim_version, 'NVIM v\zs[^\n]*'))

-- TODO: plugins count and nvim version
db.custom_footer = {
  '',
  'Version: ...coming soon...',
  'Loaded ' .. '...coming_soon...' .. ' plugins',
}

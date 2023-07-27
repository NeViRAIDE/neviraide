local M = {}

local Menu = require('nui.menu')

M.sessions = Menu({
  relative = 'editor',
  position = '50%',
  border = {
    style = 'rounded',
    text = { top = ' Session manager ', top_align = 'center' },
    padding = { 0, 1 },
  },
  win_options = {
    winhighlight = 'Normal:SessionManagerText,FloatBorder:SessionManagerBorder',
  },
  buf_options = {
    filetype = 'nui',
  },
}, {
  lines = {
    Menu.separator('Save ' .. '', {
      char = ' ',
      text_align = 'center',
    }),
    Menu.item('Save current session', { action = 'save_current_session' }),
    Menu.separator('', { char = ' ', text_align = 'center' }),
    Menu.separator('Load ' .. '', {
      char = ' ',
      text_align = 'center',
    }),
    Menu.item('Restore last session', { action = 'load_last_session' }),
    Menu.item('Restore session from list', { action = 'load_session' }),
    Menu.item(
      'Restore session from current directory',
      { action = 'load_current_dir_session' }
    ),
    Menu.separator('', { char = ' ', text_align = 'center' }),
    Menu.separator('Delete ' .. '', {
      char = ' ',
      text_align = 'center',
    }),
    Menu.item('Remove session from list', { action = 'delete_session' }),
  },
  max_width = 40,
  keymap = {
    focus_next = { 'j', '<Down>', '<Tab>' },
    focus_prev = { 'k', '<Up>', '<S-Tab>' },
    close = { '<Esc>', '<C-c>', '<C-q>', 'q' },
    submit = { '<CR>' },
  },
  on_submit = function(item) vim.fn.execute('SessionManager ' .. item.action) end,
})

return M

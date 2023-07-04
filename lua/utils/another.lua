local Input = require('nui.input')
local Menu = require('nui.menu')

local event = require('nui.utils.autocmd').event

local function newFile()
  local input = Input({
    position = '50%',
    size = {
      width = 40,
    },
    border = {
      style = 'rounded',
      text = {
        top = ' Create a new file ',
        top_align = 'center',
      },
      padding = { 0, 1 },
    },
    relative = 'editor',
    win_options = {
      winhighlight = 'Normal:String,FloatBorder:AlphaFortune',
    },
    buf_options = {
      filetype = 'nui',
    },
  }, {
    prompt = '',
    default_value = '',
    on_close = function()
      require('notify').notify("New file wasn't created!", 'error')
    end,
    on_submit = function(value)
      vim.fn.execute('enew')
      vim.fn.execute('w ' .. value)
    end,
  })
  input:on(event.BufLeave, function() input:unmount() end)
  input:map(
    'n',
    { '<Esc>', 'q', '<C-c>' },
    function() input:unmount() end,
    { noremap = true, nowait = true }
  )
  input:map(
    'i',
    { '<Esc>', '<C-q>', '<C-c>' },
    function() input:unmount() end,
    { noremap = true, nowait = true }
  )
  input:mount()
end

local sessions = Menu({
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
  on_close = function()
    require('notify').notify('Session manager was closed', 'error')
  end,
  on_submit = function(item) vim.fn.execute('SessionManager ' .. item.action) end,
})

return {
  newFile = newFile,
  sessions = sessions,
}

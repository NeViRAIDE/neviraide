--Length of filepath.
------
--Possible parameters are:
--  'file' - filename
--  'dir' - directory
--  'dirFile' - directory and filename
--  'full' - full path
---@param length string
local function filePath(length)
  if length == 'file' then
    return vim.api.nvim_exec2('echo expand("%:t")', { output = false })
  elseif length == 'dirFile' then
    return vim.api.nvim_exec2('echo @%', {})
  elseif length == 'dir' then
    return vim.api.nvim_exec2('echo expand("%:h")', {})
  elseif length == 'full' then
    return vim.api.nvim_exec2('echo expand("%:p")', {})
  end
end

local M = {}

-- TODO: realize GOLANG commands
local Input = require('nui.input')
local Menu = require('nui.menu')

local event = require('nui.utils.autocmd').event

---wrapper for go mod init
function M.inputMod()
  local input = Input({
    position = '50%',
    size = { width = 40 },
    border = {
      style = 'rounded',
      text = {
        top = ' Module name is: ',
        top_align = 'center',
      },
      padding = { 0, 2 },
    },
    relative = 'editor',
    win_options = { winhighlight = 'Normal:Normal,FloatBorder:VertSplit' },
    buf_options = { filetype = 'nui' },
  }, {
    prompt = '',
    default_value = 'github.com/',
    on_close = function()
      require('notify').notify('Mod init canceled!', 'error')
    end,
    on_submit = function(value)
      vim.fn.execute('GoModInit ' .. value)

      -- vim.fn.execute('LspRestart')
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

function M.goGet()
  local input = Input({
    position = '50%',
    size = { width = 70 },
    border = {
      style = 'rounded',
      text = {
        top = ' Package link: ',
        top_align = 'center',
        bottom = '(you can provide more than one package url)',
      },
      padding = { 0.5, 1 },
    },
    relative = 'editor',
    win_options = { winhighlight = 'Normal:Normal,FloatBorder:VertSplit' },
    buf_options = { filetype = 'nui' },
  }, {
    prompt = '',
    default_value = 'github.com/',
    on_close = function()
      require('notify').notify('Getting packages canceled!', 'error')
    end,
    on_submit = function(value)
      vim.fn.execute('GoGet ' .. value)
      vim.fn.execute('LspRestart')
    end,
  })
  input:on(event.BufLeave, function() input:unmount() end)
  input:mount()
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
end

M.tagsAdd = Menu({
  position = { row = -1, col = 1 },
  size = { width = 10, height = 3 },
  border = {
    style = 'rounded',
    text = { top = ' Add tags ', top_align = 'center' },
    padding = { 0, 1 },
  },
  relative = 'cursor',
  win_options = { winhighlight = 'Normal:Normal,FloatBorder:String' },
  buf_options = { filetype = 'nui' },
}, {
  lines = {
    Menu.item('json'),
    Menu.item('yaml'),
    Menu.item('toml'),
  },
  max_width = 10,
  keymap = {
    focus_next = { 'j', '<Down>', '<Tab>' },
    focus_prev = { 'k', '<Up>', '<S-Tab>' },
    close = { '<Esc>', '<C-q>', '<C-c>', 'q' },
    submit = { '<CR>' },
  },
  on_close = function() require('notify').notify("Tags wasn't added!", 'error') end,
  on_submit = function(item)
    print(item.text)
    vim.fn.execute('GoAddTag ' .. item.text)
  end,
})

M.tagsRemove = Menu({
  position = { row = -1, col = 1 },
  size = { width = 12, height = 3 },
  border = {
    style = 'rounded',
    text = { top = ' Remove tags ', top_align = 'center' },
    padding = { 0, 1 },
  },
  relative = 'cursor',
  win_options = { winhighlight = 'Normal:Normal,FloatBorder:DiagnosticError' },
  buf_options = { filetype = 'nui' },
}, {
  lines = {
    Menu.item('json'),
    Menu.item('yaml'),
    Menu.item('toml'),
  },
  max_width = 20,
  keymap = {
    focus_next = { 'j', '<Down>', '<Tab>' },
    focus_prev = { 'k', '<Up>', '<S-Tab>' },
    close = { '<Esc>', '<C-q>', '<C-c>', 'q' },
    submit = { '<CR>' },
  },
  on_close = function()
    require('notify').notify("Tags wasn't removed!", 'error')
  end,
  on_submit = function(item) vim.fn.execute('GoTagRm ' .. item.text) end,
})

function M.goInterface()
  local input = Input({
    position = { row = -1, col = 1 },
    size = { width = 40 },
    border = {
      style = 'rounded',
      text = {
        top = ' Receiver and interface: ',
        top_align = 'center',
      },
      padding = { 0, 1 },
    },
    relative = 'cursor',
    win_options = { winhighlight = 'Normal:Normal,FloatBorder:VertSplit' },
    buf_options = { filetype = 'nui' },
  }, {
    prompt = '',
    default_value = '',
    on_close = function()
      require('notify').notify(
        'Interface implementation was canceled!',
        'error'
      )
    end,
    on_submit = function(value) vim.fn.execute('GoImpl ' .. value) end,
  })
  input:on(event.BufLeave, function() input:unmount() end)
  input:mount()
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
end

function M.goRun()
  local input = Input({
    position = '50%',
    size = { width = 35 },
    border = {
      style = 'rounded',
      text = {
        top = ' Run Go programm: ',
        top_align = 'center',
      },
      padding = { 0, 1 },
    },
    relative = 'editor',
    win_options = { winhighlight = 'Normal:Normal,FloatBorder:DevIconCsv' },
    buf_options = { filetype = 'nui' },
  }, {
    prompt = '',
    default_value = filePath('file'),
    on_close = function()
      require('notify').notify('Running was canceled!', 'error')
    end,
    on_submit = function(value) vim.fn.execute('GoRun -F' .. value .. '"') end,
  })
  input:on(event.BufLeave, function() input:unmount() end)
  input:mount()
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
end

function M.goBuild()
  local input = Input({
    position = '50%',
    size = { width = 35 },
    border = {
      style = 'rounded',
      text = {
        top = ' Build Go programm: ',
        top_align = 'center',
      },
      padding = { 0, 1 },
    },
    relative = 'editor',
    win_options = { winhighlight = 'Normal:Normal,FloatBorder:DevIconElm' },
    buf_options = { filetype = 'nui' },
  }, {
    prompt = '',
    default_value = filePath('file'),
    on_close = function()
      require('notify').notify('Building was canceled!', 'error')
    end,
    on_submit = function(value)
      vim.fn.execute('TermExec direction=float cmd="go build ' .. value .. '"')
    end,
  })
  input:on(event.BufLeave, function() input:unmount() end)
  input:mount()
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
end

function M.goTestRun()
  local input = Input({
    position = '50%',
    size = { width = 35 },
    border = {
      style = 'rounded',
      text = {
        top = ' Run tests in: ',
        top_align = 'center',
      },
      padding = { 0, 1 },
    },
    relative = 'editor',
    win_options = { winhighlight = 'Normal:Normal,FloatBorder:DevIconPp' },
    buf_options = { filetype = 'nui' },
  }, {
    prompt = './',
    default_value = filePath('dir_only'),
    on_close = function()
      require('notify').notify("Testing wasn't running!", 'error')
    end,
    on_submit = function(value)
      vim.fn.execute(
        'TermExec direction=float cmd="go test -v ./' .. value .. '"'
      )
    end,
  })
  input:on(event.BufLeave, function() input:unmount() end)
  input:mount()
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
end

function M.goTestAll()
  vim.fn.execute('TermExec direction=float cmd="go test -v  ./..."')
end

return M

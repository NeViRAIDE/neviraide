local Input = require('nui.input')
local Menu = require('nui.menu')

local event = require('nui.utils.autocmd').event

_G.inputMod = Input({
  position = '50%',
  size = {
    width = 30,
  },
  border = {
    style = 'rounded',
    text = {
      top = ' Module name is: ',
      top_align = 'center',
    },
    padding = { 0, 1 },
  },
  relative = 'editor',
  win_options = {
    winhighlight = 'Normal:Normal,FloatBorder:VertSplit',
  },
}, {
  prompt = '',
  default_value = '',
  on_close = function() require('notify').notify('Mod init canceled!', 'error') end,
  on_submit = function(value)
    vim.fn.execute('GoMod init ' .. value)
    vim.fn.execute('LspRestart')
  end,
})
inputMod:on(event.BufLeave, function() inputMod:unmount() end)

_G.goGet = Input({
  position = '50%',
  size = { width = 70 },
  border = {
    style = 'rounded',
    text = {
      top = ' Package link: ',
      top_align = 'center',
      bottom = 'you can provide more than one package url',
    },
    padding = { 0.5, 1 },
  },
  relative = 'editor',
  win_options = {
    winhighlight = 'Normal:Normal,FloatBorder:VertSplit',
  },
}, {
  prompt = '',
  default_value = '',
  on_close = function()
    require('notify').notify('Getting packages canceled!', 'error')
  end,
  on_submit = function(value)
    vim.fn.execute('GoGet ' .. value)
    vim.fn.execute('LspRestart')
  end,
})
goGet:on(event.BufLeave, function() inputMod:unmount() end)

_G.tagsAdd = Menu({
  position = { row = -1, col = 1 },
  size = { width = 10, height = 2 },
  border = {
    style = 'rounded',
    text = { top = ' Add tags ', top_align = 'center' },
    padding = { 0, 1 },
  },
  relative = 'cursor',
  win_options = { winhighlight = 'Normal:Normal,FloatBorder:String' },
}, {
  lines = {
    Menu.item('json'),
    Menu.item('yaml'),
  },
  max_width = 10,
  keymap = {
    focus_next = { 'j', '<Down>', '<Tab>' },
    focus_prev = { 'k', '<Up>', '<S-Tab>' },
    close = { '<Esc>', '<C-c>', 'q' },
    submit = { '<CR>' },
  },
  on_close = function() require('notify').notify('Add tags canceld!', 'error') end,
  on_submit = function(item)
    print(item.text)
    vim.fn.execute('GoTagAdd ' .. item.text)
  end,
})

_G.tagsRemove = Menu({
  position = { row = -1, col = 1 },
  size = { width = 12, height = 2 },
  border = {
    style = 'rounded',
    text = { top = ' Remove tags ', top_align = 'center' },
    padding = { 0, 1 },
  },
  relative = 'cursor',
  win_options = { winhighlight = 'Normal:Normal,FloatBorder:DiagnosticError' },
}, {
  lines = {
    Menu.item('json'),
    Menu.item('yaml'),
  },
  max_width = 20,
  keymap = {
    focus_next = { 'j', '<Down>', '<Tab>' },
    focus_prev = { 'k', '<Up>', '<S-Tab>' },
    close = { '<Esc>', '<C-c>', 'q' },
    submit = { '<CR>' },
  },
  on_close = function()
    require('notify').notify('Revoming tags canceled!', 'error')
  end,
  on_submit = function(item) vim.fn.execute('GoTagRm ' .. item.text) end,
})

_G.goInterface = Input({
  position = { row = -1, col = 1 },
  size = {
    width = 40,
  },
  border = {
    style = 'rounded',
    text = {
      top = ' Receiver and interface: ',
      top_align = 'center',
    },
    padding = { 0, 1 },
  },
  relative = 'cursor',
  win_options = {
    winhighlight = 'Normal:Normal,FloatBorder:VertSplit',
  },
}, {
  prompt = '',
  default_value = '',
  on_close = function()
    require('notify').notify('Interface implementation canceled!', 'error')
  end,
  on_submit = function(value) vim.fn.execute('GoImpl ' .. value) end,
})
goInterface:on(event.BufLeave, function() inputMod:unmount() end)

_G.goRun = Input({
  position = '50%',
  size = { width = 15 },
  border = {
    style = 'rounded',
    text = {
      top = ' Run ',
      top_align = 'center',
    },
    padding = { 0, 1 },
  },
  relative = 'editor',
  win_options = {
    winhighlight = 'Normal:DevIconCsv,FloatBorder:DevIconCsv',
  },
}, {
  prompt = '',
  default_value = '',
  on_close = function() require('notify').notify('Running canceled!', 'error') end,
  on_submit = function(value) vim.fn.execute('!go run ' .. value) end,
})
goRun:on(event.BufLeave, function() inputMod:unmount() end)

_G.goBuild = Input({
  position = '50%',
  size = { width = 15 },
  border = {
    style = 'rounded',
    text = {
      top = ' Build ',
      top_align = 'center',
    },
    padding = { 0, 1 },
  },
  relative = 'editor',
  win_options = {
    winhighlight = 'Normal:VertSplit,FloatBorder:VertSplit',
  },
}, {
  prompt = '',
  default_value = '',
  on_close = function() require('notify').notify('Building canceled!', 'error') end,
  on_submit = function(value) vim.fn.execute('!go build ' .. value) end,
})
goBuild:on(event.BufLeave, function() inputMod:unmount() end)

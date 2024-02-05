local Input = require('nui.input')
local Menu = require('nui.menu')

local event = require('nui.utils.autocmd').event
local M = {}

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

return M

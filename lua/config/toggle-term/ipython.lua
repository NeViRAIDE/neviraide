local Terminal = require('toggleterm.terminal').Terminal

local ipython = Terminal:new({
    cmd = "ipython",
    count = 23,
    direction = "vertical",
})
function _ipython_toggle()
    ipython:toggle()
end

local current_file_ipython = Terminal:new({
    cmd = "ipython -i " .. vim.fn.expand("%"),
    count = 23,
    direction = "vertical",
})
function _current_file_ipython_toggle()
    current_file_ipython:toggle()
end

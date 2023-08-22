local M = {}

---@return string
function M.nvim_version()
  local nvim_full_version_info = vim.fn.execute('version')
  if nvim_full_version_info:match('NVIM') then
    return nvim_full_version_info:match('NVIM [^\n]*')
  else
    return 'Check your alpha configuration file'
  end
end

M.header = {
  type = 'text',
  val = {
    '01001110 01100101 01101111 01110110 01101001 01101101',
    '01001001 01101110 01110100 01100101 01100111 01110010 01100001 01110100 01100101 01100100',
    '01000100 01100101 01110110 01100101 01101100 01101111 01110000 01101101 01100101 01101110 01110100',
    '01000101 01101110 01110110 01101001 01110010 01101111 01101110 01101101 01100101 01101110 01110100',
    '01100010 01111001',
    '01010010 01000001 01110000 01110010 01101111 01100111 01110010 01100001 01101101 01101101',
    '',
    '. . . NEVIRAIDE . . .',
  },
  opts = { position = 'center', hl = 'AlphaHeader' },
}

---Create button for Alpha Dashboard
---@param sc string
---@param txt string
---@param keybind string?
---@param keybind_opts table?
---@param opts table?
---@return table
function M.button(sc, txt, keybind, keybind_opts, opts)
  local def_opts = {
    cursor = 0,
    align_shortcut = 'right',
    hl_shortcut = 'Boolean',
    hl = 'AlphaButtons',
    width = 23,
    position = 'center',
  }
  opts = opts and vim.tbl_extend('force', def_opts, opts) or def_opts
  opts.shortcut = sc
  local sc_ = sc:gsub('%s', '*'):gsub('SPC', '<Leader>')
  local on_press = function()
    local key = vim.api.nvim_replace_termcodes(
      keybind or sc_ .. '<Ignore>',
      true,
      false,
      true
    )
    vim.api.nvim_feedkeys(key, 't', false)
  end
  if keybind then
    keybind_opts = vim.F.if_nil(
      keybind_opts,
      { noremap = true, silent = true, nowait = true }
    )
    opts.keymap = { 'n', sc_, keybind, keybind_opts }
  end
  return { type = 'button', val = txt, on_press = on_press, opts = opts }
end

return M

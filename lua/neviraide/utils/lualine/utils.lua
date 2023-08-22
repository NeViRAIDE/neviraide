return {
  ---Get added, modified and
  ---removed diffs from the
  --gitsigns plugin.
  diff_source = function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed,
      }
    end
  end,

  ---Name of the current git
  --branch from the gitsigns
  --plugin or a message.
  ---@return string
  branch_source = function()
    local msg = 'Not in a GIT repository'
    local git_branch = vim.b.gitsigns_head
    if git_branch then return git_branch end
    return msg
  end,

  ---Name of the LSP server
  --for the current filetype
  --or a message.
  ---@return string
  lsp_source = function()
    local msg = 'No Active LSP'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,

  ---Filetype with version
  --of the interpreter.
  ---@return string
  interpreter = function()
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    if buf_ft == 'lua' then
      return _VERSION
    elseif buf_ft == 'go' then
      local go_version = vim.fn.execute(':!go version')
      return 'Go ' .. go_version:match('%d[^ ]*')
    elseif buf_ft == 'python' then
      local python_version =
        vim.fn.execute(':python import sys; print(sys.version)')
      return 'Python ' .. python_version:match('%d[^ ]*')
    end
    return buf_ft:gsub('^%l', string.upper)
  end,

  conditions = {
    ---If buffer not empty.
    ---@return boolean
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,

    ---If windows width less than 100.
    ---@return boolean
    hide_in_width = function() return vim.fn.winwidth(0) > 100 end,

    ---Hide if no diffs
    ---@return boolean
    gitdiff = function()
      return vim.b.gitsigns_status ~= '' and vim.b.gitsigns_status ~= nil
    end,
  },
}

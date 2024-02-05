-- Executes a Lua file stored in the 'buftabline' cache location set in Neovim's global variables.
dofile(vim.g.ntc .. 'buftabline')

-- Requires a utility module for handling automatic commands (autocmd).
local autocmd = require('neviraide.utils').autocmd

-- Storing the list of all buffers in a tab-specific variable.
vim.t.bufs = vim.api.nvim_list_bufs()

-- Creating a table to store buffers that are listed.
local listed_bufs = {}

-- Looping through all buffers and adding listed buffers to the 'listed_bufs' table.
for _, val in ipairs(vim.t.bufs) do
  if vim.bo[val].buflisted then table.insert(listed_bufs, val) end
end

-- Updating the tab-specific buffers list with only the listed buffers.
vim.t.bufs = listed_bufs

-- Setting up autocmds to manage buffer lists on various buffer and tab events.
-- Credits to https://github.com/ii14 for the implementation idea.
autocmd('NEVIRAIDE_newbuftab', { 'BufAdd', 'BufEnter', 'tabnew' }, {
  callback = function(args)
    local bufs = vim.t.bufs
    -- Initialize the buffer list if it doesn't exist.
    -- Add the buffer to the list if it's not already present and meets certain conditions.
    -- Conditions include being a listed buffer, being a valid buffer, and not being the current buffer.
    -- Also handles the removal of unnamed and unmodified buffers from the list.

    if vim.t.bufs == nil then
      vim.t.bufs = vim.api.nvim_get_current_buf() == args.buf and {}
        or { args.buf }
    else
      -- check for duplicates
      if
        not vim.tbl_contains(bufs, args.buf)
        and (args.event == 'BufEnter' or vim.bo[args.buf].buflisted or args.buf ~= vim.api.nvim_get_current_buf())
        and vim.api.nvim_buf_is_valid(args.buf)
        and vim.bo[args.buf].buflisted
      then
        table.insert(bufs, args.buf)
        vim.t.bufs = bufs
      end
    end

    -- remove unnamed buffer which isnt current buf & modified
    if args.event == 'BufAdd' then
      local first_buf = vim.t.bufs[1]

      if
        #vim.api.nvim_buf_get_name(first_buf) == 0
        and not vim.api.nvim_get_option_value('modified', { buf = first_buf })
      then
        table.remove(bufs, 1)
        vim.t.bufs = bufs
      end
    end
  end,
})

-- Autocmd for handling buffer deletion.
-- Removes the buffer from the tab-specific list when it's deleted.
autocmd('NEVIRAIDE_bufdel', 'BufDelete', {
  callback = function(args)
    -- Iterates through all tabs and their buffers, removing the deleted buffer.
    for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
      local bufs = vim.t[tab].bufs
      if bufs then
        for i, bufnr in ipairs(bufs) do
          if bufnr == args.buf then
            table.remove(bufs, i)
            vim.t[tab].bufs = bufs
            break
          end
        end
      end
    end
  end,
})

-- Autocmd for setting up the buffer tabline.
-- This autocmd is triggered on various events related to buffer and tab creation.
autocmd('NEVIRAIDE_buftabline', {
  'BufNew',
  'BufNewFile',
  'BufRead',
  'TabEnter',
  'TermOpen',
  'BufDelete',
  'BufWipeout',
}, {
  pattern = '*',
  callback = function()
    if
      #vim.fn.getbufinfo({ buflisted = 1 }) < 2
      and #vim.api.nvim_list_tabpages() < 2
    then
      -- Hide buftabline, if less than two buffers/tabs is open.
      vim.opt.showtabline = 0
    else
      -- Show buftabline if more than two.
      vim.opt.showtabline = 2
      vim.opt.tabline =
        "%!v:lua.require('neviraide.ui.neviraide-ui.buftabline.modules')()"
    end
  end,
})

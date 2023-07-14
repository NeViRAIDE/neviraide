local M = {}

local function if_require(module, block, errblock)
  local ok, mod = pcall(require, module)
  if ok then
    return block(mod)
  elseif errblock then
    return errblock(mod)
  else
    vim.api.nvim_err_writeln('Failed to load ' .. module .. ': ' .. mod)
    return nil
  end
end


---@param plugin string
function M.has(plugin)
  return require("lazy.core.config").spec.plugins[plugin] ~= nil
end

function M.lazy_load(plugin)
  vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
    callback = function()
      local file = vim.fn.expand "%"
      local condition = file ~= "neo-tree" and file ~= "[lazy]" and file ~= ""

      if condition then
        vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)
        if plugin ~= "nvim-treesitter" then
          vim.schedule(function()
            require("lazy").load { plugins = plugin }
            if plugin == "nvim-lspconfig" then
              vim.cmd "silent! do FileType"
              print('Language Server Protocol was started...')
            end
          end, 0)
        else
          require("lazy").load { plugins = plugin }
        end
      end
    end,
  })
end

function M.load_mappings(...)
  local args = { ... }
  if_require(
    'which-key',
    function(wk) return wk.register(unpack(args)) end,
    function(_)
      vim.api.nvim_err_writeln(
        'WhichKeys not installed; cannot apply mappings!'
      )
    end
  )
end

function M.autocmd_multi(group, cmds, clear)
  clear = (clear == nil) and true or clear
  group = vim.api.nvim_create_augroup(group, { clear = clear })
  for _, c in ipairs(cmds) do
    local opts = c[2]
    opts.group = group
    vim.api.nvim_create_autocmd(c[1], opts)
  end
end

function M.save_and_format()
  local file_name = vim.fn.expand('%:t')
  if vim.lsp.buf.server_ready() == true then
    vim.lsp.buf.format()
    vim.cmd('silent! wa')
    vim.notify(
      'File "' .. file_name .. '" was formated and saved',
      2,
      { title = 'Saved and formated', icon = '✓' }
    )
  else
    vim.cmd('silent! wa')
    vim.notify(
      'File "' .. file_name .. '" was saved',
      2,
      { title = 'Saved', icon = '✓' }
    )
  end
end

function M.filePath(length)
  if length == 'file' then
    return vim.api.nvim_exec('echo expand("%:t")', '')
  elseif length == 'dir_file' then
    return vim.api.nvim_exec('echo @%', '')
  elseif length == 'dir_only' then
    return vim.api.nvim_exec('echo expand("%:h")', '')
  elseif length == 'full' then
    return vim.api.nvim_exec('echo expand("%:p")', '')
  end
end

---@param fn fun()
function M.on_very_lazy(fn)
  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      fn()
    end,
  })
end

return M

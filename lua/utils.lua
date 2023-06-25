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

return {
  lazy_load = function(plugin)
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
              end
            end, 0)
          else
            require("lazy").load { plugins = plugin }
          end
        end
      end,
    })
  end,

  load_mappings = function(...)
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
  end,

  autocmd_multi = function(group, cmds, clear)
    clear = (clear == nil) and true or clear
    group = vim.api.nvim_create_augroup(group, { clear = clear })
    for _, c in ipairs(cmds) do
      local opts = c[2]
      opts.group = group
      vim.api.nvim_create_autocmd(c[1], opts)
    end
  end
}

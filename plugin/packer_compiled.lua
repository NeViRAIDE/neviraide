-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/ra/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/ra/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/ra/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/ra/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ra/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  aniseed = {
    loaded = true,
    needs_bufread = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/opt/aniseed"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/ra/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/ra/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-calc"] = {
    after_files = { "/home/ra/.local/share/nvim/site/pack/packer/opt/cmp-calc/after/plugin/cmp_calc.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/ra/.local/share/nvim/site/pack/packer/opt/cmp-calc"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/ra/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/ra/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/ra/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/ra/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/ra/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/ra/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/ra/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/ra/.local/share/nvim/site/pack/packer/opt/cmp_luasnip"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\2ç\14\0\0\4\0\30\0!6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\14\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2=\2\15\0015\2\16\0005\3\17\0=\3\18\0025\3\19\0=\3\20\2=\2\21\0015\2\22\0=\2\23\0015\2\24\0=\2\25\0015\2\26\0=\2\27\0015\2\28\0=\2\29\1B\0\2\1K\0\1\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\brow\3\0\rrelative\vcursor\nstyle\fminimal\bcol\3\1\vborder\vsingle&current_line_blame_formatter_opts\1\0\1\18relative_time\1\16watch_index\1\0\2\rinterval\3è\a\17follow_files\2\fkeymaps\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\r\fnoremap\2\17v <leader>hrT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\17n <leader>hU8<cmd>lua require\"gitsigns\".reset_buffer_index()<CR>\17v <leader>hsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hS2<cmd>lua require\"gitsigns\".stage_buffer()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\nsigns\1\0\n\20max_file_length\3À¸\2\vlinehl\1\24attach_to_untracked\2\20update_debounce\3d\nnumhl\1\18sign_priority\3\6\15signcolumn\2\23current_line_blame\1\22use_internal_diff\2\14word_diff\1\17changedelete\1\0\4\ttext\bâ”‚\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\bâ”‚\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\bâ”‚\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\bâ”‚\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\bâ”‚\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ra/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\2\2)\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\14impatient\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ra/.local/share/nvim/site/pack/packer/opt/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lua-fmt"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/lua-fmt"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "cmp_luasnip", "cmp-path", "cmp-nvim-lua", "cmp-calc", "cmp-nvim-lsp" },
    loaded = true,
    only_config = true
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-minimap"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/nvim-minimap"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/ra/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/ra/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/ra/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/ra/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    commands = { "TSPlaygroundToggle" },
    loaded = false,
    needs_bufread = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["symbols-outline.nvim"] = {
    commands = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ra/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/ra/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: symbols-outline.nvim
time([[Setup for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\2¼\2\0\0\3\0\6\0\a6\0\0\0009\0\1\0005\1\3\0005\2\4\0=\2\5\1=\1\2\0K\0\1\0\fkeymaps\1\0\a\17code_actions\6a\18rename_symbol\6r\17hover_symbol\6K\18goto_location\t<CR>\19focus_location\f<space>\19toggle_preview\6p\nclose\6q\1\0\b\16show_guides\2\27highlight_hovered_item\2\24show_symbol_details\2\26show_relative_numbers\1\17auto_preview\2\17show_numbers\1\rposition\nright\nwidth\3\25\20symbols_outline\6g\bvim\0", "setup", "symbols-outline.nvim")
time([[Setup for symbols-outline.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\2C\0\1\3\0\4\0\a6\1\0\0'\2\1\0B\1\2\0029\1\2\0019\2\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire§\2\0\1\a\0\f\1*6\1\0\0009\1\1\0019\1\2\1B\1\1\2\t\1\0\0X\1\14€6\1\0\0009\1\1\0019\1\3\0016\2\0\0009\2\4\0029\2\5\2'\3\6\0+\4\2\0+\5\2\0+\6\2\0B\2\5\2'\3\a\0B\1\3\1X\1\21€6\1\b\0009\1\t\1B\1\1\2\15\0\1\0X\2\14€6\1\0\0009\1\1\0019\1\3\0016\2\0\0009\2\4\0029\2\5\2'\3\n\0+\4\2\0+\5\2\0+\6\2\0B\2\5\2'\3\v\0B\1\3\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\5!<Plug>luasnip-expand-or-jump\23expand_or_jumpable\fluasnip\6n\n<C-n>\27nvim_replace_termcodes\bapi\rfeedkeys\15pumvisible\afn\bvim\2œ\2\0\1\a\0\f\1+6\1\0\0009\1\1\0019\1\2\1B\1\1\2\t\1\0\0X\1\14€6\1\0\0009\1\1\0019\1\3\0016\2\0\0009\2\4\0029\2\5\2'\3\6\0+\4\2\0+\5\2\0+\6\2\0B\2\5\2'\3\a\0B\1\3\1X\1\22€6\1\b\0009\1\t\1)\2ÿÿB\1\2\2\15\0\1\0X\2\14€6\1\0\0009\1\1\0019\1\3\0016\2\0\0009\2\4\0029\2\5\2'\3\n\0+\4\2\0+\5\2\0+\6\2\0B\2\5\2'\3\v\0B\1\3\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\5\28<Plug>luasnip-jump-prev\rjumpable\fluasnip\6n\n<C-p>\27nvim_replace_termcodes\bapi\rfeedkeys\15pumvisible\afn\bvim\2ë\1\0\2\5\0\n\0\0176\2\1\0'\3\2\0B\2\2\0029\2\3\0029\2\4\0029\3\0\0018\2\3\2'\3\5\0009\4\0\1&\2\4\2=\2\0\0015\2\a\0009\3\b\0009\3\t\0038\2\3\2=\2\6\1L\1\2\0\tname\vsource\1\0\6\tpath\v[Path]\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\tcalc\17[Calculator]\18latex_symbols\f[Latex]\fluasnip\14[Snippet]\tmenu\6 \fdefault\fpresets\flspkind\frequire\tkindï\6\1\0\a\0005\0P6\0\0\0'\1\1\0B\0\2\0029\1\2\0005\2\5\0009\3\3\0009\3\4\3=\3\6\0025\3\b\0003\4\a\0=\4\t\3=\3\n\0025\3\v\0=\3\f\0025\3\15\0009\4\r\0009\4\14\4B\4\1\2=\4\16\0039\4\r\0009\4\17\4B\4\1\2=\4\18\0039\4\r\0009\4\19\4)\5üÿB\4\2\2=\4\20\0039\4\r\0009\4\19\4)\5\4\0B\4\2\2=\4\21\0039\4\r\0009\4\22\4B\4\1\2=\4\23\0039\4\r\0009\4\24\4B\4\1\2=\4\25\0039\4\r\0009\4\26\0045\5\29\0009\6\27\0009\6\28\6=\6\30\5B\4\2\2=\4\31\0033\4 \0=\4!\0033\4\"\0=\4#\3=\3\r\0025\3%\0005\4$\0=\4&\3=\3'\0024\3\a\0005\4(\0>\4\1\0035\4)\0>\4\2\0035\4*\0>\4\3\0035\4+\0>\4\4\0035\4,\0>\4\5\0035\4-\0>\4\6\3=\3.\0025\3/\0=\0030\0025\0032\0003\0041\0=\0043\3=\0034\2B\1\2\1K\0\1\0\15formatting\vformat\1\0\0\0\17experimental\1\0\1\15ghost_text\1\fsources\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\tcalc\1\0\1\tname\rnvim_lsp\1\0\1\tname\rnvim_lua\1\0\1\tname\fluasnip\18documentation\vborder\1\0\1\17winhighlight FloatBorder:TelescopeBorder\1\t\0\0\bâ•­\bâ”€\bâ•®\bâ”‚\bâ•¯\bâ”€\bâ•°\bâ”‚\f<S-Tab>\0\n<Tab>\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\15completion\1\0\1\16completeopt\26menu,menuone,noselect\fsnippet\vexpand\1\0\0\0\14preselect\1\0\0\tNone\18PreselectMode\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-nvim-lua ]]
vim.cmd [[ packadd cmp-calc ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]
vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-buffer ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineClose lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineOpen lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutline lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'gitsigns.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

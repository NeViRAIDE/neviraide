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

local function wk_register(...)
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

local function setup()
  wk_register({
    ['<c-\\>'] = {
      ':ToggleTerm<cr>',
      'Toggle terminal ' .. icon('terminal', '', ''),
    },
    ['<c-s>'] = { ':lua save_and_format()<cr>', 'Save and format file' },
    ['<c-q>'] = { ':q<cr>', 'Quit the current window' },
    ['<c-h>'] = {
      ':wincmd h<cr>',
      'Go to right window ' .. icon('arrow-right', '→', ''),
    },
    ['<c-j>'] = {
      ':wincmd j<cr>',
      'Go to down window ' .. icon('arrow-down', '↓', ''),
    },
    ['<c-k>'] = {
      ':wincmd k<cr>',
      'Go to up window ' .. icon('arrow-up', '↑', ''),
    },
    ['<c-l>'] = {
      ':wincmd l<cr>',
      'Go to left window ' .. icon('arrow-left', '←', ''),
    },
    ['<leader>'] = {
      name = 'Plugins and features ' .. icon('rocket', '', ''),
      a = { ':Alpha<cr>', 'Alpha screen ' .. icon('home', '', '') },
      f = {
        ':Neotree toggle<cr>',
        'File explorer ' .. icon('file-directory-open-fill', '', ''),
      },
      s = {
        ':lua require("utils.startup").sessions:mount()<cr>',
        'Session manager ' .. icon('project', '', ''),
      },
      b = require('config.plugins.which-key.keybindings.main.buffers_keys'),
      c = require('config.plugins.which-key.keybindings.main.color_pic_keys'),
      d = require('config.plugins.which-key.keybindings.main.diagnostic_keys'),
      g = require('config.plugins.which-key.keybindings.main.golang_keys'),
      G = require('config.plugins.which-key.keybindings.main.git_keys'),
      l = require('config.plugins.which-key.keybindings.main.lsp_keys'),
      n = require('config.plugins.which-key.keybindings.main.notes_keys'),
      N = require('config.plugins.which-key.keybindings.main.neogen_keys'),
      t = require('config.plugins.which-key.keybindings.main.telescope_keys'),
      w = require('config.plugins.which-key.keybindings.main.windows_keys'),
    },
  }, { mode = 'n' })
  wk_register({
    ['<leader>'] = {
      name = 'Plugins and features ' .. icon('rocket', '', ''),
      l = {
        name = 'LSP ' .. icon('server', '', ''),
        a = { ':lua vim.lsp.buf.code_action()<cr>', 'Code action' },
      },
      g = {
        name = 'GIT ' .. icon('git-branch', '', ''),
        r = { ':Gitsigns reset_hunk<cr>', 'Reset hunk' },
        s = { ':Gitsigns stage_hunk<cr>', 'Stage hunk' },
      },
    },
  }, { mode = 'v' })
end

return {
  setup = setup,
  wk_register = wk_register,
}

local i = require('neviraide.ui.neviraide-ui.icons.utils').icon

---@type StatusLineUtils
local M = {
  ignored = function()
    local list = {
      'help',
      'TelescopePrompt',
      'neviraideDashboard',
      'lazy',
      'mason',
      'lspinfo',
      'neviraide-ui',
      'neviraide_ui',
      'nui',
      'colorschemes',
      'create',
      'renameTab',
      'nuiInput',
      'nui_sm',
      'nofile',
      'neo-tree',
      'neo-tree-popup',
      'terminal',
      'notify',
      'neotest-output',
      'neotest-summary',
    }
    for type in pairs(list) do
      if vim.bo.filetype == list[type] then return false end
    end
    return true
  end,

  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,

  hide_in_width = function(size)
    if size == nil then size = 90 end
    return vim.o.columns > size
  end,
  -- M.hide_in_width = function() return vim.fn.winwidth(0) > 100 end

  mode_color = {
    ['n'] = { i('NORMAL', 'vim-normal-mode', 0, 1), 'St_NormalMode' },
    ['no'] = {
      i('NORMAL', 'vim-normal-mode', 0, 1) .. ' (no)',
      'St_NormalMode',
    },
    ['nov'] = { i('NORMAL', 'vim-normal-mode', 0, 1) .. ' (nov)', 'Directory' },
    ['noV'] = { i('NORMAL', 'vim-normal-mode', 0, 1) .. ' (noV)', 'Directory' },
    ['noCTRL-V'] = { i('NORMAL', 'vim-normal-mode', 0, 1), 'Directory' },
    ['niI'] = { i('NORMAL', 'vim-normal-mode', 0, 1) .. ' i', 'Directory' },
    ['niR'] = { i('NORMAL', 'vim-normal-mode', 0, 1) .. ' r', 'Directory' },
    ['niV'] = { i('NORMAL', 'vim-normal-mode', 0, 1) .. ' v', 'Directory' },
    ['nt'] = {
      i('NORMAL', 'vim-normal-mode', 0, 1)
        .. '-'
        .. i('TERMINAL', 'vim-terminal-mode', 0, 1),
      'St_NTerminalMode',
    },
    ['ntT'] = {
      i('NORMAL', 'vim-normal-mode', 0, 1)
        .. '-'
        .. i('TERMINAL', 'vim-terminal-mode', 0, 1)
        .. ' (ntT)',
      'St_NTerminalMode',
    },

    ['v'] = { i('VISUAL', 'vim-visual-mode', 0, 1), 'St_VisualMode' },
    ['vs'] = {
      i('VISUAL', 'vim-visual-mode', 0, 1) .. '-CHAR (Ctrl O)',
      'St_VisualMode',
    },
    ['V'] = {
      i('VISUAL', 'vim-visual-mode', 0, 1) .. '-LINE',
      'St_VisualMode',
    },
    ['Vs'] = {
      i('VISUAL', 'vim-visual-mode', 0, 1) .. '-LINE',
      'St_VisualMode',
    },
    [''] = {
      i('VISUAL', 'vim-visual-mode', 0, 1) .. '-BLOCK',
      'St_VisualMode',
    },

    ['i'] = { i('INSERT', 'vim-insert-mode', 0, 1), 'St_InsertMode' },
    ['ic'] = {
      i('INSERT', 'vim-insert-mode', 0, 1) .. ' (completion)',
      'St_InsertMode',
    },
    ['ix'] = {
      i('INSERT', 'vim-insert-mode', 0, 1) .. ' completion',
      'St_InsertMode',
    },

    ['t'] = { i('TERMINAL', 'vim-terminal-mode', 0, 1), 'St_TerminalMode' },

    ['R'] = { i('REPLACE', 'vim-replace-mode', 0, 1), 'St_ReplaceMode' },
    ['Rc'] = {
      i('REPLACE', 'vim-replace-mode', 0, 1) .. ' (Rc)',
      'St_ReplaceModeSubstitute',
    },
    ['Rx'] = {
      i('REPLACE', 'vim-replace-mode', 0, 1) .. 'a (Rx)',
      'St_ReplaceMode',
    },
    ['Rv'] = {
      i('INSERT', 'vim-insert-mode', 0, 1) .. '- ',
      'St_ReplaceMode',
    },
    ['Rvc'] = {
      i('INSERT', 'vim-insert-mode', 0, 1) .. '-  (Rvc)',
      'St_ReplaceMode',
    },
    ['Rvx'] = {
      i('INSERT', 'vim-insert-mode', 0, 1) .. '-  (Rvx)',
      'St_ReplaceMode',
    },

    ['s'] = { i('SELECT', 'vim-select-mode', 0, 1), 'St_SelectMode' },
    ['S'] = {
      i('SELECT', 'vim-select-mode', 0, 1) .. '-LINE',
      'St_SelectMode',
    },
    [''] = {
      i('SELECT', 'vim-select-mode', 0, 1) .. '-BLOCK',
      'St_SelectMode',
    },

    ['c'] = { i('COMMAND', 'vim-command-mode', 0, 1), 'St_CommandMode' },
    ['cv'] = { i('COMMAND', 'vim-command-mode', 0, 1), 'St_CommandMode' },
    ['ce'] = { i('COMMAND', 'vim-command-mode', 0, 1), 'St_CommandMode' },
    ['r'] = { 'PROMPT', 'St_ConfirmMode' },
    ['rm'] = { 'MORE', 'St_ConfirmMode' },
    ['r?'] = { 'CONFIRM', 'St_ConfirmMode' },
    ['x'] = { 'CONFIRM', 'St_ConfirmMode' },
    ['!'] = {
      i('TERMINAL', 'vim-terminal-mode', 0, 1),
      'St_TerminalMode',
    },
  },
}
return M

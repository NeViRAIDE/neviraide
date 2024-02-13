return function()
  dofile(vim.g.ntc .. 'neotree')

  local icon = require('neviraide-ui.icons.utils').icon
  local fc = require('neo-tree.sources.filesystem.components')

  local function borders()
    local b = vim.g.b
    if b == 'none' or b == 'shadow' then return 'single' end
  end

  return {
    popup_border_style = borders(),
    event_handlers = {
      {
        event = 'file_opened',
        handler = function()
          require('neo-tree.command').execute({ action = 'close' })
        end,
      },
    },
    sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols' },
    default_component_configs = {
      diagnostics = {
        symbols = {
          hint = icon('', 'light-bulb', 0, 1),
          info = icon('', 'info', 0, 1),
          warn = icon('', 'alert', 0, 1),
          error = icon('', 'x-circle', 0, 1),
        },
      },
      git_status = {
        symbols = {
          added = icon('', 'diff-added'),
          modified = icon('', 'diff-modified'),
          deleted = icon('', 'diff-removed'),
        },
      },
      icon = {
        folder_closed = icon('', 'file-directory-fill'),
        folder_open = icon('', 'file-directory-open-fill'),
        folder_empty = icon('', 'file-directory'),
      },
      modified = {
        symbol = icon('', 'pencil'),
      },
    },
    filesystem = {
      components = {
        name = function(config, node, state)
          local result = fc.name(config, node, state)
          if node:get_depth() == 1 and node.type ~= 'message' then
            result.text = vim.fn.fnamemodify(node.path, ':t')
          end
          return result
        end,
      },
      filtered_items = {
        always_show = { '.gitignore' },
      },
      use_libuv_file_watcher = true,
    },
    nesting_rules = {
      ['package.json'] = {
        pattern = '^package%.json$',
        files = { 'package-lock.json', 'yarn*' },
      },
      ['go'] = {
        pattern = '(.*)%.go$',
        files = { '%1_test.go' },
      },
      ['js-extended'] = {
        pattern = '(.+)%.js$',
        files = { '%1.js.map', '%1.min.js', '%1.d.ts' },
      },
      ['docker'] = {
        pattern = '^dockerfile$',
        ignore_case = true,
        files = { '.dockerignore', 'docker-compose.*', 'dockerfile*' },
      },
    },
  }
end

return function(_, opts)
  local icon = require('stigmata.utils').icon

  dofile(vim.g.ntc .. 'mason')

  require('mason').setup({
    ui = {
      border = vim.g.b,
      width = 0.6,
      height = 0.8,
      icons = {
        package_installed = icon('', 'check', 0, 1),
        package_pending = icon('', 'sync', 0, 1),
        package_uninstalled = icon('', 'x', 0, 1),
      },
    },
  })

  local mr = require('mason-registry')
  mr:on('package:install:success', function()
    vim.defer_fn(function()
      -- trigger FileType event to possibly load this newly installed LSP server
      require('lazy.core.handler.event').trigger({
        event = 'FileType',
        buf = vim.api.nvim_get_current_buf(),
      })
    end, 100)
  end)

  local function ensure_installed()
    for _, tool in ipairs(opts.ensure_installed) do
      local p = mr.get_package(tool)
      if not p:is_installed() then p:install() end
    end
  end

  if mr.refresh then
    mr.refresh(ensure_installed)
  else
    ensure_installed()
  end
end

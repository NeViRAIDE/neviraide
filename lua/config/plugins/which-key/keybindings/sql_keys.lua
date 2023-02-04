local wk_register =
  require('config.plugins.which-key.keybindings.main').wk_register

local function attach_sql(bufnr)
  wk_register({
    ['<leader>'] = {
      name = 'Plugins and features ' .. icon('rocket', '', ''),
      S = {
        name = 'SQL ' .. icon('database', '', ''),
        e = {
          name = 'Execute',
          q = { ':SqlsExecuteQuery<cr>', 'Execute the query' },
          v = {
            ':SqlsExecuteQueryVertical<cr>',
            'Same as "q", but the results are displayed vertically',
          },
        },
        s = {
          name = 'Show',
          d = { ':SqlsShowDatabases<cr>', 'Show a list of databases' },
          s = { ':SqlsShowSchemas<cr>', 'Show a list of schemas' },
          c = {
            ':SqlsShowConnections<cr>',
            'Show a list of database connections',
          },
        },
        S = {
          name = 'Switch',
          d = { ':SqlsSwitchDatabases<cr>', 'Switch to a different database' },
          c = {
            ':SqlsSwitchConnections<cr>',
            'Switch to a different database connection',
          },
        },
      },
    },
  }, { buffer = bufnr, mode = 'n' })
end

return { attach_sql = attach_sql }

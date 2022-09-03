-- TODO: auto virtual env
local lspconfig = require "lspconfig"

-- local util = require('lspconfig/util')
-- local path = util.path
--
-- local function find_virtual_environment(workspace)
--     for _, dir in pairs({'venv', 'venv1', 'venv2'}) do
--         local match = vim.fn.glob(path.join(workspace, dir))
--         if match ~= '' then
--             return path.dirname(match)
--         end
--     end
--     return nil
-- end
--
-- local function get_python_path(virtual_env_path)
--     if virtual_env_path then
--         if vim.fn.has('win32') == 1 then
--             python_path = virtual_env_path .. "\\Scripts" .. "\\python"
--         else
--             python_path = path.join(virtual_env_path, 'bin', 'python')
--         end
--             return python_path
--     end
--     return exepath('python3') or exepath('python') or 'python'
-- end
--
--
-- local function setup_virtual_env(virtual_env_path)
--     vim.env.VIRTUAL_ENV = virtual_env_path
--
--     if vim.fn.has('win32') == 1 then
--         new_path = virtual_env_path..'\\Scripts'..';'..vim.env.Path
--         vim.env.PATH = new_path
--     else
--         vim.env.PATH = path.join(virtual_env_path, "/bin:", vim.env.PATH)
--     end
-- end

lspconfig.pyright.setup {
    on_attach = require "lsp.on_attach".build(),
    capabilities = require("lsp.capabilities").build(),
    root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname)
    end;
    single_file_support = true,
    flags = { debounce_text_changes = 150 },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    },
    -- before_init = function(_, config)
    --     if not vim.env.VIRTUAL_ENV then
    --         virtual_env_path = find_virtual_environment(config.root_dir)
    --         setup_virtual_env(virtual_env_path)
    --         python_path = get_python_path(virtual_env_path)
    --         config.settings.python.pythonPath = python_path
    --     end
    -- end
}
